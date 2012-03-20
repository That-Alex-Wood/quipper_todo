class QuipperTodo.Collections.Todos extends Backbone.Collection
  url: 'todos'
  model: QuipperTodo.Models.Todo
  sortCol: 'created_at'
  sortDir: 'asc'

  comparator: (model) -> 
    return model.get('name')

  toggleSortDir: ->
    @sortDir = (if @sortDir == 'asc' then 'desc' else 'asc')
