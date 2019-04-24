module Markup
  module Rails
    module Processors
      # To add a new markup processor you have to inherit from this class.
      # In this class you have to add to_* methods for available output
      # formats.
      #
      # Example:
      #
      #     # lib/markup/rails/processors/obscure_processor.rb
      #     require "markup/rails/processors/base"
      #     
      #     module Markup
      #       module Rails
      #         module Processors
      #           class ObscureProcessor < Base
      #             def to_html
      #               processor.to_html
      #             end
      #
      #             private
      #
      #             def processor
      #               Obscure.new(@string)
      #             end
      #           end
      #         end
      #       end
      #     end
      #
      class Base
        attr_accessor :string, :options

        def initialize(string, options = {})
          @string = string
          @options = options
        end
      end
    end
  end
end
