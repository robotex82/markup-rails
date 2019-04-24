#!/bin/bash
GEM_NAME=${PWD##*/}
INSTALL_NAME=${GEM_NAME//cmor_/cmor\:}

# Delete old dummy app
rm -rf spec/dummy

# Generate new dummy app
DISABLE_MIGRATE=true rake dummy:app
rm spec/dummy/.ruby-version

# Satisfy prerequisites
cd spec/dummy

# I18n configuration
touch config/initializers/i18n.rb
echo "Rails.application.config.i18n.available_locales = [:en, :de]" >> config/initializers/i18n.rb
echo "Rails.application.config.i18n.default_locale    = :de" >> config/initializers/i18n.rb

# Add example model
rails g model Post markdown:text textile:text textile_with_pandoc:text
sed -i '2i\  include Markup::Rails::ActiveRecord' app/models/post.rb
sed -i '3i\  acts_as_markup :markdown, processor: :markdown' app/models/post.rb
sed -i '4i\  acts_as_markup :textile, processor: :textile' app/models/post.rb
sed -i '5i\  acts_as_markup :textile_with_pandoc, processor: :pandoc, from: :textile' app/models/post.rb

# Add redcloth support
sed -i '17i\require "redcloth"' config/application.rb

# Setup database
rails db:migrate
rails db:test:prepare