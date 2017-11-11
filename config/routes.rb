Rails.application.routes.draw do
  namespace :api do
    resources :videos do
      resources :comments
    end
  end
end
