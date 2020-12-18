Rails.application.routes.draw do
  devise_for :users,controllers: {
    registrations: 'users/registrations'
  }
  # api
  namespace :api do
    # users/:id/follow
    resources :users, only: [] do
      member do
        post :follow
      end
    end

    # stores/id/clap
    resources :stories, only: [] do
      member do
        post :clap
        post :bookmark
      end
    end
  end

  resources :stories do   
    resources :comments, only: [:create]
  end

  # /@使用者名稱/文章標題
  get '@:username/:story_id', to: 'pages#show', as: 'story_page'
  get '@:username', to: 'pages#user', as: 'user_page'

  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/demo", to: 'pages#demo'

end
