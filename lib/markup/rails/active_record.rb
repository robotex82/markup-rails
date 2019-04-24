module Markup
  module Rails
    # Example:
    #
    #     # app/models/post.rb
    #     class Post < ApplicationRecord
    #       include Markup::Rails::ActiveRecord
    #     end
    #
    module ActiveRecord
      extend ActiveSupport::Concern
      
      included do
      end

      class_methods do
        # Example:
        #
        #     # app/models/post.rb
        #     class Post < ApplicationRecord
        #       include Markup::Rails::ActiveRecord
        #
        #       acts_as_markup :body, processor: :markdown
        #     end
        #
        def acts_as_markup(*args)
          options = args.extract_options!
          args.each { |a| (@@markup ||= {})[a] = options  }
          define_markup_accessors
        end

        def define_markup_accessors
          @@markup.each do |attr, options|
            define_method(attr) do |format = nil|
              case format
              when :markup
                "Markup::Rails::Processors::#{(@@markup[attr][:processor]).to_s.camelize}".constantize.new(read_attribute(attr).to_s, @@markup[attr].slice(:from))
              when nil
                read_attribute(attr)
              else
                "Markup::Rails::Processors::#{(@@markup[attr][:processor]).to_s.camelize}".constantize.new(read_attribute(attr).to_s, @@markup[attr].slice(:from)).send("to_#{format}")
              end
            end
          end
        end
      end
    end
  end
end
