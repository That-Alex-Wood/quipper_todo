class QuipperTodo.Views.TodosForm extends Backbone.View
    template: JST['todos/form']
    className: 'edit_inline'
    tagName: 'tr'
    initialize: ->
      @model = @options.model
      @model.on('change', @render, @)

    events:
      'click #todo_save': 'saveTodo'
      
    saveTodo: (event) ->
      event.preventDefault()
      @.$('#errors').html('')
      attributes =  name: @.$('.todo_name input').val(), deadline: @.$('.todo_deadline input').val()
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
      @.$('.todo_deadline input').datepicker(dateFormat: "yy-mm-dd")
      this