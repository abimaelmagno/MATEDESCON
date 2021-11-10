Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  #get "firmas/:id", to: "compras#show", as: "compras"

  resources :firmas, except: [:edit] do

    resources :banks, only: [:index, :show]
    resources :fornecedores, only: [:index, :show, :edit, :update]
  end

end
