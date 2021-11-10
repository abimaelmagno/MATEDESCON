Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  #get "firmas/:id", to: "compras#show", as: "compras"

<<<<<<< HEAD
  resources :firmas, except: [:edit]
  
=======
  resources :firmas, except: [:edit] do
    resources :fornecedores, only: [:show]
  end

>>>>>>> b16a7644716ba76c314e53352520ad4cf86884cf
end
