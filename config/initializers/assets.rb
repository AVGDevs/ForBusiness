# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

#app/assets
Rails.application.config.assets.precompile += %w( admins_backoffice.js         admins_backoffice.css
                                                  users_backoffice.js          users_backoffice.css
                                                  colaborador.js               colaborador.css
                                                  departamento.js              departamento.css
                                                  empresa.js                   empresa.css
                                                  fato.js                      fato.css
                                                  home.js                      home.css
                                                  tarefa.js                    tarefa.css
                                                  devise/sessions.js           devise/sessions.css
                                                  admins_backoffice.coffee     admins_backoffice.css
                                                  users_backoffice.coffee      users_backoffice.css
                                                  devise/registrations.coffee  devise/registrations.css
                                                  devise/passwords.coffee      devise/passwords.css)

#lib/assets
Rails.application.config.assets.precompile += %w( sb-admin-2.js   sb-admin-2.css 
                                                  custom.js       custom.css
                                                  javascripts/demo
                                                  img.jpg
                                                  user.png )
