Rails.application.routes.draw do
  devise_for :admins, controllers: {
    registrations:  'admins/registrations',
    sessions:       'admins/sessions',
    passwords:      'admins/passwords'
  }

  devise_scope :admins do
    get 'admins/home', to: 'admins/works#home'
  end

  devise_for :users, controllers: {
    registrations:  'users/registrations',
    passwords:      'users/passwords',
    sessions:       'users/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :users, only: [:show]

  resources :k_doramas do
    collection do
      get :top
      get :search
    end
  end
  resources  :reviews do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  root 'k_doramas#top'
end
