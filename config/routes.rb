Rails.application.routes.draw do

  namespace :users_backoffice do
    get "welcome/index"
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

  resources :departamento
  match "delete_departamento" => "departamento#delete_departamento", via: "get"
  match "departamento/:id/edit" => "departamento#update", via: "post"

  resources :colaborador
  match "delete_colaborador" => "colaborador#delete_colaborador", via: "get"
  match "colaborador/:id/edit" => "colaborador#update", via: "post"

  resources :tarefa
  match "delete_tarefa" => "tarefa#delete_tarefa", via: "get"
  match "tarefa/:id/edit" => "tarefa#update", via: "post"

  resources :fato
  match 'folha_concluidas' => 'fato#folha_concluidas', via: 'get'
  match 'folha_pendentes' => 'fato#folha_pendentes', via: 'get'
  match 'concluir_folha' => 'fato#concluir_folha', via: 'get'
  match 'desfazer_folha' => 'fato#desfazer_folha', via: 'get'

  match 'escrita_concluidas' => 'fato#escrita_concluidas', via: 'get'
  match 'escrita_pendentes' => 'fato#escrita_pendentes', via: 'get'
  match 'concluir_escrita' => 'fato#concluir_escrita', via: 'get'
  match 'desfazer_escrita' => 'fato#desfazer_escrita', via: 'get'

  match 'ativo_concluidas' => 'fato#ativo_concluidas', via: 'get'
  match 'ativo_pendentes' => 'fato#ativo_pendentes', via: 'get'
  match 'concluir_ativo' => 'fato#concluir_ativo', via: 'get'
  match 'desfazer_ativo' => 'fato#desfazer_ativo', via: 'get'

  match 'pagamento_recebimento_concluidas' => 'fato#pagamento_recebimento_concluidas', via: 'get'
  match 'pagamento_recebimento_pendentes' => 'fato#pagamento_recebimento_pendentes', via: 'get'
  match 'concluir_pagamento_recebimento' => 'fato#concluir_pagamento_recebimento', via: 'get'
  match 'desfazer_pagamento_recebimento' => 'fato#concluir_pagamento_recebimento', via: 'get'

  match 'estoque_concluidas' => 'fato#estoque_concluidas', via: 'get'
  match 'estoque_pendentes' => 'fato#estoque_pendentes', via: 'get'
  match 'concluir_estoque' => 'fato#concluir_estoque', via: 'get'
  match 'desfazer_estoque' => 'fato#desfazer_estoque', via: 'get'


  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
