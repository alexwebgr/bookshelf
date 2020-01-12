Rails.application.routes.draw do
  get 'uploader/upload'
  post 'uploader/do_upload'
  get 'sessions/login'
  post 'sessions/do_login'
  get 'sessions/register'
  post 'sessions/do_register'
  delete 'sessions/logout'
  resources :uploads
  resources :books
  resources :users

  root 'sessions#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
