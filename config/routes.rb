Rails.application.routes.draw do
  root "dashboard#index"

  resources :questions do
    resources :answers do
      post "toggle_vote", on: :member
    end
    post "toggle_vote", on: :member
  end

  namespace :api do
    resources :questions do
      resources :answers
    end

    post "login" => "api_auth#token"
  end

  get "login" => "user_sessions#new", as: "login"
  post "login" => "user_sessions#create"
  delete "login" => "user_sessions#destroy"

  get "signup" => "users#new", as: "signup"
  post "signup" => "users#create"

  get "confirm_account" => "users#confirm", as: "confirm_account"
end
