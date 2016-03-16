Rails.application.routes.draw do
  root to: "app_home#index"

  post "/sign-in" ,                   to: "sessions#sign_in" ,    as: :sign_in
  get  "/sign-out",                   to: "sessions#sign_out",    as: :sign_out

  get "/sign-up",                     to: "users#sign_up",        as: :sign_up

  get  "/assessment/:id"              , to: "assessment#assessment_form", as: :assessment_form
  post "/assessment/:id/update_home"  , to: "home_assessment#update_home", as: :update_home
  post "/assessment/:id/update_dependents", to: "dependent_assessment#update_dependents", as: :update_dependents


  # get "/assessment/:id/home_info",    to: "home_assessment#home_info", as: :home_info
  # post "/assessment/:id/update_home", to: "home_assessment#update_home", as: :update_home
  # post "/home_assessment/:id/run"   , to: "home_assessment#home_asmt_checks", as: :home_asmt_checks

end
