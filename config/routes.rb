Rails.application.routes.draw do

  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  #get "firmas/:id", to: "compras#show", as: "compras"
  # patch "/firmas/:id", to: "firmas#vendas", as: "firma_venda"



  resources :firmas, except: [:edit] do
    resources :fornecedores, only: [:index, :show, :edit, :update]
    resources :banks, only: [:index, :show]
    resources :lancamentos, only: [:index, :show, :edit, :update]
    resources :vendas, only: [:update]

  end

end
