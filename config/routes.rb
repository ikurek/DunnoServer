Rails.application.routes.draw do
  resources :questions

  # LOGIN
  get "login" => "user_sessions#new", as: "login"
  post "login" => "user_sessions#create"

  # REGISTER
  get "register" => "users#new", as: "register"
  post "register" => "users#create"
end
