# frozen_string_literal: true
require "kramdown"
require "rao-view_helper"

require "markup/rails/engine"
require "markup/rails/active_record"

require "markup/rails/processors/markdown"
require "markup/rails/processors/textile" if Gem.loaded_specs.has_key?('RedCloth')
require "markup/rails/processors/pandoc" if Gem.loaded_specs.has_key?('pandoc-ruby')

module Markup
  module Rails
  end
end
