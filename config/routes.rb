Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'products#index'
  resources :users, only: [:show, :new] do
    collection do
      get 'signout'
      get 'first'
      get 'second'
      get 'third'
      get 'forth'
      get 'fifth'
      get 'detail'
      get 'profile'
      get 'credit'
    end
  end
  resources :products, only: [:index, :new, :show] do
    collection do
      get 'buy'
    end
  end
end

