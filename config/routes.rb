Rails.application.routes.draw do
  get "posts/index"
  get "posts/show"
  get "posts/new"
  get "posts/edit"
  get "users/show"
  get "users/edit"
  get "homes/top"
  # Deviseのログイン機能
  devise_for :users

  # 最初にログイン画面を表示
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  
  # マイページ
  get "mypage", to: "users#show", as: "mypage"

  # ユーザー編集
  get "users/edit", to: "users#edit", as: "edit_user"
  patch "users", to: "users#update", as: "user"

  # 投稿機能
  resources :posts

  # ヘルスチェック
  get "up" => "rails/health#show", as: :rails_health_check
end