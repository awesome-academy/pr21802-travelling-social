Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    mount Ckeditor::Engine => '/ckeditor'
    devise_for :users
    root 'page#index'
    mount RailsAdmin::Engine => '/wp-admin', as: 'rails_admin'
    resources :users, only: [:show, :edit, :update, :destroy] do
      resources :follows, only: [:create, :destroy, :index]
    end
    resources :micro_posts do
      resources :upvotes, only: [:create, :destroy]
      resources :downvotes, only: [:create, :destroy]
    end
    resources :profiles, only: :show
    resources :locations
    resources :cities, only: [:show, :index]
    resources :cities, only: :show do
      resources :locations, only: [:index, :show]
    end
  end
end
