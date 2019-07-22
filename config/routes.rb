Rails.application.routes.draw do
  root 'markets#index'
  get 'markets' => 'markets#index'
end
