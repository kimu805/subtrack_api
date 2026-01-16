Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "login", to: "auth#create"
      delete :logout, to: "sessions#destroy"
      get "me", to: "users#me"
    end
  end
end
