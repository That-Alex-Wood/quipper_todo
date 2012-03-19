class QuipperTodo.Views.TodosForm extends Backbone.View
    template: JST['todos/form']
    className: 'edit_inline'

    initialize: ->
      @model = @options.model
      @model.on('change', @render, @)

    events:
      'submit form#inline_new_todo': 'updateTodo'
      
    updateTodo: (event) ->
      event.preventDefault()
      @.$('#errors').html('')
      attributes =  name: $('#inline_new_todo_name').val(), deadline: $('#inline_new_todo_deadline').val()
      @model.save attributes,
        wait: true, 
        success: -> QuipperTodo.index_view.collection.trigger('reset')
        error: @handleError

    handleError: (todo, response) ->
      if response.status == 422
          errors  = $.parseJSON(response.responseText)
          for attribute, messages of errors
            @.$('#errors').append("<p><span class='badge badge-error'>#{attribute} #{message}</span></p>") for message in messages

    render: ->
      $(@el).html(@template(todo: @model))
      @.$('#inline_new_todo_deadline').datepicker(dateFormat: "yy-mm-dd")
      this