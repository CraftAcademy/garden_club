Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: "users/omniauth_callbacks" }
  root controller: :home, action: :index
  get 'profile', controller: :profile, action: :index
end
