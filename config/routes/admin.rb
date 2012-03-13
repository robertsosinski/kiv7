Kiv7::Application.routes.draw do
  namespace :admin do
    resources :stats
  end
end
