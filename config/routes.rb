Rails.application.routes.draw do
  root to: "app_home#index"

  post "/sign-in" ,                   to: "sessions#sign_in" ,    as: :sign_in
  get  "/sign-out",                   to: "sessions#sign_out",    as: :sign_out

  get "/sign-up",                     to: "users#sign_up",        as: :sign_up

  get "/assessment/:id/user_info",    to: "assessment#user_info", as: :user_info
  post "/assessment/:id/update_user", to: "assessment#update_user", as: :update_user

  get "/assessment/:id/home_info",    to: "home_assessment#home_info", as: :home_info
  post "/assessment/:id/update_home", to: "home_assessment#update_home", as: :update_home
end
