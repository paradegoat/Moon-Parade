Rails.application.routes.draw do

   resources :collections

   devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

   resources :portfolios, except: [:show] do
       put :sort, on: :collection
   end

    get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
    get 'moon-parade', to: 'pages#home'
    get 'about-me', to: 'pages#about'

    get 'contact', to: 'pages#contact'

  root to: 'collections#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
