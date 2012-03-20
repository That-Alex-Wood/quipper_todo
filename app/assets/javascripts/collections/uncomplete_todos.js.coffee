class QuipperTodo.Collections.UncompleteTodos extends Backbone.Collection
  url: 'todos/search/uncompleted'
  model: QuipperTodo.Models.Todo
  sortCol: 'created_at'
  sortDir: 'asc'
  
  comparator: (model) -> 
    return model.get('name')

  toggleSortDir: ->
    @sortDir = (if @sortDir == 'asc' then 'desc' else 'asc')
    
