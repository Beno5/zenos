Rails.application.routes.draw do
  get 'blog_posts/new'
  get 'blog_posts/edit'
  get 'blog_posts/:id', to: 'blog_posts#show', as: 'blog_posts_show'
  get 'pages/home'
  get 'pages/about'
  get 'pages/projects'
  get 'pages/blog'
  get 'pages/contact'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
