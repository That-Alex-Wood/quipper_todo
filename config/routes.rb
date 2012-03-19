QuipperTodo::Application.routes.draw do
  resources :todos
  match '/todos/search/:filter_type' => 'todos#index'
  root :to => 'todos#index'
end
