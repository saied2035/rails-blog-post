Rails.application.routes.draw do
  devise_for :users, controllers: {
                 sessions: 'sessions',
                 registrations: 'registrations'
               }
    root to: 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   resources :users, only: [:index, :show] do
   resources :posts, only: [:index, :new,:create,:show,:destroy] do
     resources :comments, only: [:new, :create, :destroy]
     resources :likes, only: [:create]
   end
  end

  namespace :api do
   resources :users, only: [:index, :show] do
   resources :posts, only: [:index] do
     resources :comments, only: [:index,:create]
   end
   end    
end

  # Defines the root path route ("/")

end
