Rails.application.routes.draw do
  devise_for :users, path: 'auth',
                     path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  get 'blog_posts/new'
  get 'blog_posts/edit'
  get 'project_posts/new'
  get 'project_posts/edit'
  resources :blog_posts
  resources :project_posts
  get 'pages/about'
  get 'pages/projects'
  get 'pages/blog'
  get 'pages/contact'
  get 'pages/nutrition'
  get 'pages/zdrava-ishrana'
  
  post 'contact_form/send_email'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#home'
end
