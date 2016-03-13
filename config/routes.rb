Rails.application.routes.draw do
  root to: "home#index"

  post "/sign-in"                , to: "sessions#sign_in" , as: :sign_in
  get  "/sign-out"               , to: "sessions#sign_out", as: :sign_out

  get "/assessment", to: "assessment#user_info", as: :user_info # refactor: user_id wildcard
end
