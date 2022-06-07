Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   get 'users', to: 'users#index'
   get 'users/:id' , to: 'users#show' , as: 'user'
   get 'users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  # Defines the root path route ("/")
  root 'users#index'
end
