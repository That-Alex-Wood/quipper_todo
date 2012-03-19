class QuipperTodo.Views.Sidbar extends Backbone.View
    template: JST['todos/sidebar']
    className: 'well sidebar-nav'
      
    events:
      'click li a': 'filterTodos'
    filterTodos: (event) ->
      event.preventDefault()
      QuipperTodo.todos_router.navigate($(event.target).attr('href'), trigger: true)
    render: ->
      $(@el).html(@template())
      this