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
                                                  devise/registrations.coffee  devise/registrations.css
                                                  devise/passwords.coffee      devise/passwords.css
                                                  devise/sessions.js           devise/sessions.css)

#lib/assets
Rails.application.config.assets.precompile += %w( javascripts/sb-admin-2.js   
                                                  stylesheets/sb-admin-2.css 
                                                  javascripts/sb-admin-2.min.js   
                                                  stylesheets/sb-admin-2.min.css 
                                                  javascripts/custom.js       
                                                  stylesheets/custom.css
                                                  javascripts/demo/chart-area-demo.js
                                                  javascripts/demo/chart-bar-demo.js
                                                  javascripts/demo/chart-pie-demo.js
                                                  javascripts/demo/datatables-demo.js
                                                  popper.js/dist/popper.js
                                                  img.jpg
                                                  user.png)
