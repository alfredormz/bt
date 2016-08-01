Rails.application.routes.draw do
  devise_for :users
	resources :bars, only: [:index]
  get 'angular_test', to: "angular_test#index"

  root 'bars#index'
end
