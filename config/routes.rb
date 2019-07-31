Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'products#index'

  get 'products/show' => 'products#show'

  resources :products, only: [:index, :new] do
    collection do
      get 'buy'
    end
  end
  
end

