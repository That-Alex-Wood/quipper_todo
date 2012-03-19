class QuipperTodo.Routers.Todos extends Backbone.Router
  routes:
    '' : 'index'
    'todos/search/:filter_type': 'search'
  index: ->
    QuipperTodo.sidebar = new QuipperTodo.Views.Sidbar()
    $('#side_bar').html(QuipperTodo.sidebar.render().$el)

    @collection = new QuipperTodo.Collections.Todos()
    collection = @collection
    collection.fetch(success: (model, response)->
      QuipperTodo.index_view = new QuipperTodo.Views.TodosIndex(collection: collection)
      $('#container').html(QuipperTodo.index_view.render().$el);
    )
  
  search: (type) ->
    switch type
      when 'late'        then @collection = new QuipperTodo.Collections.LateTodos()
      when 'uncompleted' then @collection = new QuipperTodo.Collections.UncompleteTodos()
    
    collection = @collection
    collection.fetch(success: (models, response) ->
      QuipperTodo.index_view.collection.reset(models.toJSON())
    )

