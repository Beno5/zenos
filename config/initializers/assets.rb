# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w[application.*.js]
Rails.application.config.assets.precompile += %w[application.*.css]
Rails.application.config.assets.precompile += %w[*.woff2 *.ttf]
Rails.application.config.assets.precompile += %w(
  plugins.min.js
  theme.js
  view.contact.js
  custom.js
  theme.init.js
  modernizr.min.js
)

Rails.application.config.assets.precompile += %w( vendor/simple-line-icons/css/simple-line-icons.css )
Rails.application.config.assets.paths << Rails.root.join("app", "assets", "stylesheets", "vendor", "simple-line-icons", "fonts")
Rails.application.config.assets.precompile += %w( *.eot *.woff *.woff2 *.ttf *.svg )


# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
