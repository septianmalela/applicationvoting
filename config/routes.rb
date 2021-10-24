Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :admins, controllers: { sessions: 'admin/devise/sessions' }
  devise_for :users, controllers: {
    sessions: 'user/devise/sessions',
    registrations: 'user/devise/registrations'
  }

  namespace :admin do
    resources :homes do
      member do
        get :show_vote_post
      end
      collection do
        get :show_user_vote
        get :show_user_unvote
      end
    end
    resources :posts
    resources :users do
      member do
        patch :active_user
        patch :nonactive_user
      end
    end
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
