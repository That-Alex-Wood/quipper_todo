class QuipperTodo.Collections.UncompleteTodos extends Backbone.Collection
  url: 'todos/search/uncompleted'
  model: QuipperTodo.Models.Todo
  comparator: (model) -> 
    return model.get('name')

