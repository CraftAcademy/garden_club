Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root controller: :home, action: :index
  get 'profile', controller: :profile, action: :index
end
