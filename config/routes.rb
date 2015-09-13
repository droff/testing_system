Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users

  resources :questions

  namespace :api do
    namespace :v1 do
      resources :questions, defaults: { format: :json }, only: [:index, :create]
    end
  end

  get '*path' => redirect('/')
end
