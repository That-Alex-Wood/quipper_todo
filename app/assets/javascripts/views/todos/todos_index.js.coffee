class QuipperTodo.Views.TodosIndex extends Backbone.View

  template: JST['todos/index']
  id: 'container'
  initialize: ->
    @collection = @options.collection
    @collection.on('reset', @render, this)
    @collection.on('add', @appendTodo, this)
    @collection.on('change', @render, this)
  events:
    'submit #new_todo': 'newTodo'

  newTodo: (event) ->
    event.preventDefault()
    @.$('#errors').html('')
    attributes =  name: $('#new_todo_name').val(), deadline: $('#new_todo_deadline').val()
    @collection.create attributes,
      wait: true, 
      success: -> @.$('#new_todo input[type=text]').each((i,el) -> $(el).val(''))
      error: @handleError
    

  appendTodo: (todo) ->
    view = new QuipperTodo.Views.TodosShow(model: todo)
    @.$('#todos').append(view.render().el)
    this

  handleError: (todo, response) ->
    if response.status == 422
        errors  = $.parseJSON(response.responseText)
        for attribute, messages of errors
          @.$('#errors').append("<p><span class='badge badge-error'>#{attribute} #{message}</span></p>") for message in messages

  render: ->
    $(@el).html(@template())
    $(@el).find('#new_todo_deadline').datepicker(dateFormat: "yy-mm-dd")
    @collection.each(@appendTodo, @)
    this