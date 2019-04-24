require "markup/rails/processors/base"
require 'pandoc-ruby'

module Markup
  module Rails
    module Processors
      class Pandoc < Base
        def method_missing(m, *args, &block)
          if supported_outputs.include?(m)
            processor.send(m, *args, &block)
          else
            super
          end
        end

        # We need to explicitly define to_json because it is already defined by
        # rails.
        def to_json(*args, &block)
          processor.to_json(*args, &block)
        end

        private

        def supported_outputs
          @supported_outputs ||= PandocRuby::WRITERS.keys.collect { |w| "to_#{w}".to_sym }
        end

        def processor
          PandocRuby.new(@string, from: @options[:from])
        end
      end
    end
  end
end
