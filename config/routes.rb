Rails.application.routes.draw do
  root to: 'pages#home'
  resources :players, except: :show
end
