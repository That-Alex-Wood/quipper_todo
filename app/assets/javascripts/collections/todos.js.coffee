class QuipperTodo.Collections.Todos extends Backbone.Collection
  url: 'todos'
  model: QuipperTodo.Models.Todo
  comparator: (model) -> 
    return model.get('name')

