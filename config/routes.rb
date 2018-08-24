Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    get "/results" => "results#index"
    get "/results/:id" => "results#show"
    delete "/results/:id" => "results#destroy"
    # post "/results" => "results#create"
    # patch "/results/:id" => "results#update"

    post "/users" => "users#create"
    post "/sessions" => "sessions#create"

    get "/user_pages" => "user_pages#index"
    post "/user_pages" => "user_pages#create"
    get "/user_pages/:id" => "user_pages#show"
    patch "/user_pages/:id" => "user_pages#update"
    delete "/user_pages/:id" => "user_pages#destroy"

    get "/exams" => "exams#index"
    post "/exams" => "exams#create"
    get "/exams/:id" => "exams#show"
    patch "/exams/:id" => "exams#update"
    delete "/exams/:id" => "exams#destroy"

    get "/lab_tests" => "lab_tests#index"
    post "/lab_tests" => "lab_tests#create"
    get "/lab_tests/:id" => "lab_tests#show"
    patch "/lab_tests/:id" => "lab_tests#update"
    delete "/lab_tests/:id" => "lab_tests#destroy"

    get "/shots" => "shots#index"
    post "/shots" => "shots#create"
    get "/shots/:id" => "shots#show"
    patch "/shots/:id" => "shots#update"
    delete "/shots/:id" => "shots#destroy"

    get "/vitals" => "vitals#index"
    post "/vitals" => "vitals#create"
    get "/vitals/:id" => "vitals#show"
    patch "/vitals/:id" => "vitals#update"
    delete "/vitals/:id" => "vitals#destroy"
  end
end
