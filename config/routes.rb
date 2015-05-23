Rails.application.routes.draw do

  resources :posts

  devise_for :users, controllers: {
     sessions: 'users/sessions',
     registrations: 'users/registrations'
   }

  get '/mines' => 'posts#mines'

  root 'static_pages#index'

end
