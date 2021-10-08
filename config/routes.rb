Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :admins, controllers: { sessions: 'admin/devise/sessions' }

  namespace :admin do
    resources :homes
    resources :posts
    root 'homes#index'
  end

  namespace :user do
    resources :homes
  end

  root 'user/homes#index'
end
