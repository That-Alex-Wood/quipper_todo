class QuipperTodo.Views.TodosShow extends Backbone.View
    template: JST['todos/show']
    className: 'row'

    initialize: ->
      @model = @options.model
      @model.on('change', @render, @)

    events:
      'change #is_done' : 'todoChanged'
      'click #todo_edit': "todoEdit"
      'click #todo_delete': "todoDelete"
      'click #todo_tweet': "todoTweet"
      
    todoTweet: (event) ->
      console.log(event)
      new QuipperTodo.Models.Twit({text: @model.get('name') }).save()
      
    todoChanged: (event) ->
      if @.$(':checkbox').attr('checked') == 'checked'
        @model.set(done: true)
      else
        @model.set(done: false)
      @model.save()
    
    todoDelete: (event) ->
      @model.destroy(
        wait: true
        success: -> QuipperTodo.index_view.collection.reset()
      )
      
    todoEdit: (event) ->
      @.$('.todo_attributes').hide()
      $(@el).prepend(new QuipperTodo.Views.TodosForm(model: @model).render().el)

      
    render: ->
      $(@el).html(@template(todo: @model))
      this