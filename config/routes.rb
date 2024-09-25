Rails.application.routes.draw do
  scope '(:locale)', locale: /en|ba/ do
    devise_for :users, path: 'auth',
                       path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

    resources :blog_posts
    resources :project_posts
    get 'pages/about'
    get 'pages/projects'
    get 'pages/blog'
    get 'pages/contact'
    get 'pages/nutrition'
    get 'pages/zdrava-ishrana'
    get 'pages/landing'

    post 'contact_form/send_email'
    post 'contact_form/send_email_landing'

    root 'pages#home'
  end

  # Redirect za root putanju bez specificiranog jezika
  get '/', to: redirect("/#{I18n.default_locale}")
end
