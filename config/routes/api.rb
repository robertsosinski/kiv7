Kiv7::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tasks do
        member do
          put :toggle
        end
      end
    end
  end
end
