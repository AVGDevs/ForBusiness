Rails.application.routes.draw do

  namespace :users_backoffice do
    get "welcome/index"
    resources :fato
      match 'fato/:departamento_id/:status_id/(:mesano)/index' => 'fato#index', via: 'get'
      match 'fato/:id/concluir_tarefa' => 'fato#concluir_tarefa', via: 'get'
      match 'fato/:id/desfazer_conclusao' => 'fato#desfazer_conclusao', via: 'get'
    resources :log_usuario
      match 'log_usuario/:tarefa_id/historico' => 'log_usuario#historico', via: 'get'
  end

  namespace :admins_backoffice do
    get "welcome/index"
  end

  devise_for :users

  devise_for :admins
  
  get "home/index"
  
  resources :empresa
  match "delete_empresa" => "empresa#delete_empresa", via: "get"
  match "empresa/:id/edit" => "empresa#update", via: "post"
  match "admins_backoffice/empresa/criar_tarefas_mensais" => "admins_backoffice/empresa#criar_tarefas_mensais", via: "post"
  match "empresa/criar_tarefas_mensais" => "empresa#criar_tarefas_mensais", via: "post"
  
  resources :departamento
  match "delete_departamento" => "departamento#delete_departamento", via: "get"
  match "departamento/:id/edit" => "departamento#update", via: "post"

  resources :colaborador
  match "delete_colaborador" => "colaborador#delete_colaborador", via: "get"
  match "colaborador/:id/edit" => "colaborador#update", via: "post"

  resources :tarefa
  match "delete_tarefa" => "tarefa#delete_tarefa", via: "get"
  match "tarefa/:id/edit" => "tarefa#update", via: "post"
  
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
