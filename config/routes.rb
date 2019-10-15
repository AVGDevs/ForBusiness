Rails.application.routes.draw do

  namespace :users_backoffice do
    get 'welcome/index'
  end

  namespace :admins_backoffice do
    get 'welcome/index'
  end

  devise_for :users

  devise_for :admins
  
  get 'home/index'
  
  resources :empresa
  match 'delete_empresa' => 'empresa#delete_empresa', via: 'get'

  resources :departamento
  match 'delete_departamento' => 'departamento#delete_departamento', via: 'get'

  resources :colaborador
  match 'delete_colaborador' => 'colaborador#delete_colaborador', via: 'get'

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
