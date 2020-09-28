Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :categories, only: [:show]
  resources :products, only: [:show]
  resource :cart, only: [:show, :destroy]
  
  namespace :dashboard do
    root 'products#index'
    resources :products, except: [:show]
    resources :vendors, except: [:show]
    resources :categories, except: [:show] do
      collection do
        put :sort
      end
    end
  end

  # api/v1/subscribe
  namespace :api do
    namespace :v1 do
      post :subscribe, to: "utils#subscribe"
      post :cart, to: "utils#cart"
    end
  end
end
