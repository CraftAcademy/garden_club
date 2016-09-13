Rails.application.routes.draw do
  devise_for :users
  root controller: :home, action: :index
  get 'profile', controller: :profile, action: :index
end
