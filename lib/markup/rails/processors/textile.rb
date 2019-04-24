require "markup/rails/processors/base"
require 'redcloth'

module Markup
  module Rails
    module Processors
      class Textile < Base
        def to_html
          processor.to_html
        end

        private

        def processor
          RedCloth.new(@string)
        end
      end
    end
  end
end
