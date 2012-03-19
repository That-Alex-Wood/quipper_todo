QuipperTodo::Application.routes.draw do
  resources :todos
  resource :twit, :only => :create
  match '/todos/search/:filter_type' => 'todos#index'
  root :to => 'todos#index'
end
