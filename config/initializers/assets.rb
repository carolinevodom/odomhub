# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

Rails.application.config.assets.precompile += %w( jquery.min.js 
jquery_ujs.js 
jquery-ui.min.js 
application.js 
stimulus-autocomplete.js
autocomplete.js
jquery.js
jquery-ui.js
autocomplete-rails.js
controllers/application.js
controllers/index.js
controllers/hello_controller.js
controllers/recipe_ingredients_controller.js
application.css
)



# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
