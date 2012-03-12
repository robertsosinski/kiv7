Kiv7::Application.routes.draw do
  scope :module => :www do
    resources :sessions
    resources :users
    resources :lists
  end
  
  namespace :api do
    namespace :v1 do
      resources :tasks
    end
  end
end
