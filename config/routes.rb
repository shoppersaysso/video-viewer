Rails.application.routes.draw do

  root to: 'welcome#home'

  namespace :api do
    resources :videos do
      resources :comments
    end
  end


end
