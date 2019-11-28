namespace :dev do

  DEFAULT_PASSWORD = 123456

  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD") { %x(rails db:drop) }
      show_spinner("Criando BD") { %x(rails db:create) }
      show_spinner("Migrando BD") { %x(rails db:migrate) } 
      show_spinner("Cadastrando coordenador padrão") { %x(rails dev:add_default_admin) }
      show_spinner("Cadastrando colaborador padrão") { %x(rails dev:add_default_user) }
      show_spinner("Cadastrando empresas") { %x(rails dev:add_default_empresas) }  
      show_spinner("Cadastrando departamentos") { %x(rails dev:add_default_departamentos) }  
      show_spinner("Cadastrando tarefas") { %x(rails dev:add_default_tarefas) }
      show_spinner("Cadastrando status") { %x(rails dev:add_default_statuses) }
      show_spinner("Cadastrando fatos") { %x(rails dev:add_default_fatos) }    
    else
      puts "Não está em ambiente de desenvolvimento!" 
    end
  end

  desc "Adiciona o coordenador padrão"
  task add_default_admin: :environment do
    Admin.create!(
    email: 'admin@admin.com',
    password: DEFAULT_PASSWORD,
    password_confirmation: DEFAULT_PASSWORD
  )
  end

  #desc "Adiciona o administradores extras"
  desc "Adiciona o colaborador padrão"
  task add_default_user: :environment do
    User.create!(
    email: 'user@user.com',
    password: DEFAULT_PASSWORD,
    password_confirmation: DEFAULT_PASSWORD
  )
  end

  desc "Cria empresas padrão"
  task add_default_empresas: :environment do
    Empresa.create!(
      [
        { nomeEmpresa: "Márcio e Pedro Henrique Financeira ME",
          cnpjEmpresa: "39500055000104",
          statusEmpresa: "Ativa"},
        { nomeEmpresa: "Renan e Eduarda Pizzaria Delivery ME",
          cnpjEmpresa: "19736147000172",
          statusEmpresa: "Ativa"},
        { nomeEmpresa: "Emanuel e Antonio Pizzaria Delivery ME",
          cnpjEmpresa: "88453416000106",
          statusEmpresa: "Ativa"},
        { nomeEmpresa: "Patrícia e Clarice Marketing Ltda",
          cnpjEmpresa: "99042921000184",
          statusEmpresa: "Ativa"},
        { nomeEmpresa: "Heloise e Cauê Mudanças Ltda",
          cnpjEmpresa: "42711154000131",
          statusEmpresa: "Ativa"}
        ]
    )
  end

  desc "Cria status padrão"
  task add_default_statuses: :environment do
    Status.create!(
      [
        {status: "Concluído"
        },
        {status: "Pendente"
        }
      ]
    )
  end


  desc "Cria departamentos padrão"
  task add_default_departamentos: :environment do
    Departamento.create! (
      [
        { nomeDepartamento: "Folha de pagamento",
         abreviacao: "Fol"
        },
        {nomeDepartamento: "Escrita fiscal",
         abreviacao: "Esc"
        },
        {nomeDepartamento: "Ativo fixo",
         abreviacao: "Ati"
        },
        {nomeDepartamento: "Pgto e Recebimento",
         abreviacao: "Pgt"
        },
        {nomeDepartamento: "Estoque",
         abreviacao: "Est"
        }
      ]
    )
  end

  desc "Cria tarefas padrão"
  task add_default_tarefas: :environment do
    Tarefa.create! (
      [
        {nomeTarefa: "Fechamento da folha",
        departamento_id: 1
        },
        {nomeTarefa: "Importação da folha",
          departamento_id: 1
        },
        {nomeTarefa: "Importação das provisões",
          departamento_id: 1
        },
        {nomeTarefa: "Fechamento ISSQN",
          departamento_id: 2
        },
        {nomeTarefa: "Fechamento ICMS",
          departamento_id: 2
        },
        {nomeTarefa: "Fechamento IPI",
          departamento_id: 2
        },
        {nomeTarefa: "Importação da escrita fiscal",
          departamento_id: 2
        },
        {nomeTarefa: "Importação dos serviços",
          departamento_id: 2
        },
        {nomeTarefa: "Fechamento IPI",
          departamento_id: 2
        },
        {nomeTarefa: "Aquisições e baixas",
          departamento_id: 3
        },
        {nomeTarefa: "Depreciação",
          departamento_id: 3
        },
        {nomeTarefa: "Importação e depreciações",
          departamento_id: 3
        },
        {nomeTarefa: "Remessas e retornos",
          departamento_id: 4
        },
        {nomeTarefa: "Pagamentos",
          departamento_id: 4
        },
        {nomeTarefa: "Recebimentos",
          departamento_id: 4
        },
        {nomeTarefa: "Conciliação bancária",
          departamento_id: 4
        },
        {nomeTarefa: "Fechamento dos estoques",
          departamento_id: 5
        },
        {nomeTarefa: "Importação dos estoques",
          departamento_id: 5
        }
      ]
    )
  end

  desc "Adiciona os fatos padrão"
  task add_default_fatos: :environment do
    Fato.create! (
      [
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/05",
          tarefa_id: 1,
          empresa_id: 1,
          departamento_id: 1
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/05",
          tarefa_id: 2,
          empresa_id: 1,
          departamento_id: 1
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/05",
          tarefa_id: 3,
          empresa_id: 1,
          departamento_id: 1
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/05",
          tarefa_id: 4,
          empresa_id: 1,
          departamento_id: 2
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/05",
          tarefa_id: 7,
          empresa_id: 1,
          departamento_id: 2
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/05",
          tarefa_id: 8,
          empresa_id: 1,
          departamento_id: 2
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/05",
          tarefa_id: 9,
          empresa_id: 1,
          departamento_id: 2
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/05",
          tarefa_id: 10,
          empresa_id: 1,
          departamento_id: 3
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/05",
          tarefa_id: 11,
          empresa_id: 1,
          departamento_id: 3
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/05",
          tarefa_id: 12,
          empresa_id: 1,
          departamento_id: 3
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/05",
          tarefa_id: 13,
          empresa_id: 1,
          departamento_id: 4
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/05",
          tarefa_id: 14,
          empresa_id: 1,
          departamento_id: 4
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/05",
          tarefa_id: 15,
          empresa_id: 1,
          departamento_id: 4
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/05",
          tarefa_id: 16,
          empresa_id: 1,
          departamento_id: 4
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/05",
          tarefa_id: 17,
          empresa_id: 1,
          departamento_id: 5
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/05",
          tarefa_id: 18,
          empresa_id: 1,
          departamento_id: 5
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/10",
          tarefa_id: 1,
          empresa_id: 2,
          departamento_id: 1
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/10",
          tarefa_id: 2,
          empresa_id: 2,
          departamento_id: 1
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/10",
          tarefa_id: 3,
          empresa_id: 2,
          departamento_id: 1
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/10",
          tarefa_id: 5,
          empresa_id: 2,
          departamento_id: 2
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/10",
          tarefa_id: 7,
          empresa_id: 2,
          departamento_id: 2
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/10",
          tarefa_id: 8,
          empresa_id: 2,
          departamento_id: 2
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/10",
          tarefa_id: 9,
          empresa_id: 2,
          departamento_id: 2
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/10",
          tarefa_id: 10,
          empresa_id: 2,
          departamento_id: 3
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/10",
          tarefa_id: 11,
          empresa_id: 2,
          departamento_id: 3
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/10",
          tarefa_id: 12,
          empresa_id: 2,
          departamento_id: 3
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/10",
          tarefa_id: 13,
          empresa_id: 2,
          departamento_id: 4
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/10",
          tarefa_id: 14,
          empresa_id: 2,
          departamento_id: 4
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/10",
          tarefa_id: 15,
          empresa_id: 2,
          departamento_id: 4
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/10",
          tarefa_id: 16,
          empresa_id: 2,
          departamento_id: 4
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/10",
          tarefa_id: 17,
          empresa_id: 2,
          departamento_id: 5
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/10",
          tarefa_id: 18,
          empresa_id: 2,
          departamento_id: 5
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/15",
          tarefa_id: 1,
          empresa_id: 3,
          departamento_id: 1
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/15",
          tarefa_id: 2,
          empresa_id: 3,
          departamento_id: 1
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/15",
          tarefa_id: 3,
          empresa_id: 3,
          departamento_id: 1
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/15",
          tarefa_id: 6,
          empresa_id: 3,
          departamento_id: 2
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/15",
          tarefa_id: 7,
          empresa_id: 3,
          departamento_id: 2
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/15",
          tarefa_id: 8,
          empresa_id: 3,
          departamento_id: 2
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/15",
          tarefa_id: 9,
          empresa_id: 3,
          departamento_id: 2
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/15",
          tarefa_id: 10,
          empresa_id: 3,
          departamento_id: 3
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/15",
          tarefa_id: 11,
          empresa_id: 3,
          departamento_id: 3
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/15",
          tarefa_id: 12,
          empresa_id: 3,
          departamento_id: 3
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/15",
          tarefa_id: 13,
          empresa_id: 3,
          departamento_id: 4
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/15",
          tarefa_id: 14,
          empresa_id: 3,
          departamento_id: 4
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/15",
          tarefa_id: 15,
          empresa_id: 3,
          departamento_id: 4
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/15",
          tarefa_id: 16,
          empresa_id: 3,
          departamento_id: 4
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/15",
          tarefa_id: 17,
          empresa_id: 3,
          departamento_id: 5
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/15",
          tarefa_id: 18,
          empresa_id: 3,
          departamento_id: 5
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/20",
          tarefa_id: 1,
          empresa_id: 4,
          departamento_id: 1
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/20",
          tarefa_id: 2,
          empresa_id: 4,
          departamento_id: 1
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/20",
          tarefa_id: 3,
          empresa_id: 4,
          departamento_id: 1
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/20",
          tarefa_id: 4,
          empresa_id: 4,
          departamento_id: 2
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/20",
          tarefa_id: 7,
          empresa_id: 4,
          departamento_id: 2
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/20",
          tarefa_id: 8,
          empresa_id: 4,
          departamento_id: 2
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/20",
          tarefa_id: 9,
          empresa_id: 4,
          departamento_id: 2
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/20",
          tarefa_id: 10,
          empresa_id: 4,
          departamento_id: 3
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/20",
          tarefa_id: 11,
          empresa_id: 4,
          departamento_id: 3
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/20",
          tarefa_id: 12,
          empresa_id: 4,
          departamento_id: 3
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/20",
          tarefa_id: 13,
          empresa_id: 4,
          departamento_id: 4
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/20",
          tarefa_id: 14,
          empresa_id: 4,
          departamento_id: 4
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/20",
          tarefa_id: 15,
          empresa_id: 4,
          departamento_id: 4
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/20",
          tarefa_id: 16,
          empresa_id: 4,
          departamento_id: 4
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/20",
          tarefa_id: 17,
          empresa_id: 4,
          departamento_id: 5
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/20",
          tarefa_id: 18,
          empresa_id: 4,
          departamento_id: 5
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/25",
          tarefa_id: 1,
          empresa_id: 5,
          departamento_id: 1
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/25",
          tarefa_id: 2,
          empresa_id: 5,
          departamento_id: 1
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/25",
          tarefa_id: 3,
          empresa_id: 5,
          departamento_id: 1
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/25",
          tarefa_id: 4,
          empresa_id: 5,
          departamento_id: 2
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/25",
          tarefa_id: 7,
          empresa_id: 5,
          departamento_id: 2
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/25",
          tarefa_id: 8,
          empresa_id: 5,
          departamento_id: 2
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/25",
          tarefa_id: 9,
          empresa_id: 5,
          departamento_id: 2
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/25",
          tarefa_id: 10,
          empresa_id: 5,
          departamento_id: 3
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/25",
          tarefa_id: 11,
          empresa_id: 5,
          departamento_id: 3
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/25",
          tarefa_id: 12,
          empresa_id: 5,
          departamento_id: 3
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/25",
          tarefa_id: 13,
          empresa_id: 5,
          departamento_id: 4
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/25",
          tarefa_id: 14,
          empresa_id: 5,
          departamento_id: 4
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/25",
          tarefa_id: 15,
          empresa_id: 5,
          departamento_id: 4
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/25",
          tarefa_id: 16,
          empresa_id: 5,
          departamento_id: 4
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/25",
          tarefa_id: 17,
          empresa_id: 5,
          departamento_id: 5
        },
        {status_id: 2,
          dataVencimentoTarefa: "2019/01/25",
          tarefa_id: 18,
          empresa_id: 5,
          departamento_id: 5
        }

      ]
    )
  end

  #desc "Adiciona o administrador extras"
  #task add_extras_admin: :environment do
  #  10.times do |i|
  #    Admin.create!(
  #    email: Faker::Internet.email,
  #    password: DEFAULT_PASSWORD,
  #    password_confirmation: DEFAULT_PASSWORD
  #    )
  #  end
  #end

  private
  def show_spinner(msg_start,msg_end = "Concluido!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin # Automatic animation with default interval
    yield
    spinner.success("(#{msg_end})")
  end

end
