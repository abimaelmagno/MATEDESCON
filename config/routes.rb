Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  resources :firmas, except: [:edit] do

    resources :banks, only: [:index, :show]
  end

end
