Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    get "/results" => "results#index"
    get "/results/:id" => "results#show"
    post "/results" => "results#create"
    patch "/results/:id" => "results#update"
    delete "/results/:id" => "results#destroy"

    post "/users" => "users#create"
    post "/sessions" => "sessions#create"

  end
end
