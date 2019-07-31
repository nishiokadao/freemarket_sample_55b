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
      get 'first'
      get 'second'
      get 'third'
      get 'forth'
      get 'fifith'
    end
  end

end