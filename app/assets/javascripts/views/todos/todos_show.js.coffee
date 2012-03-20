class QuipperTodo.Views.TodosShow extends Backbone.View
    template: JST['todos/show']
    tagName: 'tr'
    initialize: ->
      @model = @options.model
      @model.on('change', @render, @)
      
    events:
      'change #is_done'   : 'todoChanged'
      'click #todo_edit'  : "todoEdit"
      'click #todo_delete': "todoDelete"
      'click #todo_tweet' : "todoTweet"

    todoTweet: (event) ->
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
        success: -> QuipperTodo.index_view.collection.trigger('change')
      )
      
    todoEdit: (event) ->
      @.$el.replaceWith(new QuipperTodo.Views.TodosForm(model: @model).render().el)

      
    render: ->
      $(@el).html(@template(todo: @model))
      this