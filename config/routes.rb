Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    resources :copy, only: %i(show index), param: :key, constraints: { key: /[^\/]+/ }
    resources :refresh, only: %i(create)
  end
end
