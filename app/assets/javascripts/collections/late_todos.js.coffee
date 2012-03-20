class QuipperTodo.Collections.LateTodos extends Backbone.Collection
  url: 'todos/search/late'
  sortCol: 'created_at'
  sortDir: 'asc'
  model: QuipperTodo.Models.Todo

  comparator: (model) -> 
    model.get('name')

  toggleSortDir: ->
    @sortDir = (if @sortDir == 'asc' then 'desc' else 'asc')

