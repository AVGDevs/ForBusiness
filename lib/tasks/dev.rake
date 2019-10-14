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

  desc "Adiciona o colaborador padrão"
  task add_default_user: :environment do
    User.create!(
    email: 'user@user.com',
    password: DEFAULT_PASSWORD,
    password_confirmation: DEFAULT_PASSWORD
  )
  end

  private
  def show_spinner(msg_start,msg_end = "Concluido!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin # Automatic animation with default interval
    yield
    spinner.success("(#{msg_end})")
  end

end
