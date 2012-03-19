class QuipperTodo.Collections.LateTodos extends Backbone.Collection
  url: 'todos/search/late'
  model: QuipperTodo.Models.Todo
  comparator: (model) -> 
    return model.get('name')

