Kiv7::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tasks
    end
  end
end
