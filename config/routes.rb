Rails.application.routes.draw do
  root 'boards#index'
  resources :boards, :only => [:index, :create, :update, :destroy, :show]
end
