Rails.application.routes.draw do
  devise_for :users

  root "pages#home"
  get '/pages', to: "pages#home"

  resources :books
end
