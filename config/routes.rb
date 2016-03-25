Rails.application.routes.draw do
  root to: "app_home#index"

  get   "/sign-in",                     to: "sessions#new" ,                          as: :sign_in
  post  "/sign-in" ,                    to: "sessions#create"
  get   "/sign-out",                    to: "sessions#sign_out",                      as: :sign_out

  get   "/sign-up",                     to: "users#sign_up",                          as: :sign_up
  post  "/users",                       to: "users#create",                           as: :users

  get  "/assessment",                   to: "assessment#assessment_form" ,            as: :assessment_form
  post "/assessment/update_home",       to: "home_assessment#update_home",            as: :update_home
  post "/assessment/add_dependent",     to: "dependent_assessment#add_dependent",     as: :add_dependent
  delete "/assessment/remove_dependent/:id", to: "dependent_assessment#remove_dependent", as: :remove_dependent
  post "/assessment/add_contact",     to: "contact_assessment#add_contact",     as: :add_contact
  delete "/assessment/remove_contact/:id", to: "contact_assessment#remove_contact", as: :remove_contact

  get "/todo",                          to:"todo#index",                              as: :todo

  get "/plan",                          to: "plan#index",                              as: :plan
end
