Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'search', to: "welcome#search"
  resources :categories, only: [:show]
  resources :products, only: [:show]
  resource :cart, only: [:show, :destroy] do
    collection do
      get :checkout
    end
  end
  
  resources :orders, except: [:new, :edit, :update, :destroy] do
    collection do
      get :confirm  # orders/confirm
    end

    member do
      delete :cancel    # orders/:id/cancel
      post :pay         # orders/:id/pay
      get :pay_confirm  # orders/:id/pay_confirm
    end
  end

  namespace :dashboard, path: "cs0429cem" do
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
