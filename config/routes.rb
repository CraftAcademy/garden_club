Rails.application.routes.draw do
  devise_for :users
  root controller: :home, action: :index
  get 'profile/index'
  get 'profile/edit'
end
