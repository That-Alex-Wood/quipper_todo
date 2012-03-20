window.QuipperTodo =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    QuipperTodo.todos_router = new QuipperTodo.Routers.Todos()
    Backbone.history.start()
      

$(document).ready ->
  QuipperTodo.init()
