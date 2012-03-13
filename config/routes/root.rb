Kiv7::Application.routes.draw do
  scope :module => :root do
    resources :sessions
    resources :users
    resources :lists
  end
end