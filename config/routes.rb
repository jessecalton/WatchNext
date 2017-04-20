Rails.application.routes.draw do
    resources :users do
      resources :movies
    end
end
