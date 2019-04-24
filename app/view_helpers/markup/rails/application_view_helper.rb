module Markup
  module Rails
    # Example:
    #
    #     # app/controllers/application_controller.rb
    #     class ApplicationController < ActionController::Base
    #       view_helper Markup::Rails::ApplicationViewHelper, as: :markup_helper
    #     end
    class ApplicationViewHelper < Rao::ViewHelper::Base
      # Example:
      #
      #     = markup_helper(self).to_html(post, :body)
      def to_html(object, method)
        handler = object.send(method, :markup)
        return if handler.nil?
        erb_string = ::ERB.new(object[method.to_sym].to_s, 0).result(binding)
        handler.class.new(erb_string, handler.options).to_html.html_safe
      end
    end
  end
end
