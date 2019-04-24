require "markup/rails/processors/base"

module Markup
  module Rails
    module Processors
      class Markdown < Base
        def to_html
          processor.to_html
        end

        private

        def processor
          Kramdown::Document.new(@string)
        end
      end
    end
  end
end
