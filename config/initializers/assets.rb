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
Rails.application.config.assets.precompile += %w(   colaboradors.css
                                                    empresas.css
                                                    fatos.css
                                                    home.css
                                                    tarefas.css
                                                    devise/sessions.css
                                                    users_backoffice.css
                                                    admins_backoffice.css )
 

Rails.application.config.assets.precompile += %w(   cable.js
                                                    colaboradors.js
                                                    empresas.js
                                                    fatos.js                                           
                                                    home.js
                                                    tarefas.js      
                                                    devise/sessions.js
                                                    users_backoffice.coffee
                                                    admins_backoffice.coffee )
