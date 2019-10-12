Rails.application.routes.draw do
  get 'tarefa/index'
  get 'colaborador/index'
  get 'empresa/index'
  get 'departamento/index'
  get 'fato/index'
  get 'home/index'
  get 'users/index'
  get 'admins/index'


  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
