Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # localost:3000/posts
  # resourseで定義することによってルーティングのデフォが定義される
    # localost:3000/posts/index
  resources :posts, only: [:index]
end