Rails.application.routes.draw do
  namespace :api do
    resources :videos
    resources :comments
  end
end
