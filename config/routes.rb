Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :admins, controllers: { sessions: 'admin/devise/sessions' }
  devise_for :users, controllers: {
    sessions: 'user/devise/sessions',
    registrations: 'user/devise/registrations'
  }

  namespace :admin do
    resources :homes
    resources :posts
    resources :users
    resources :jadwal_votes
    root 'homes#index'
  end

  namespace :user do
    resources :homes do
      member do
        patch :vote
      end
    end
  end

  root 'user/homes#index'
end
