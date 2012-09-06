App::Application.routes.draw do
  devise_for :users

  resources :comments
end
