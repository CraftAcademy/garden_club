Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: "users/omniauth_callbacks" }
  resources :users do
    resources :articles, shallow: true
    get 'profile', controller: :profile, action: :index
  end
  root controller: :home, action: :index
  resources :tags, only: :show

end
