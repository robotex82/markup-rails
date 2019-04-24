# frozen_string_literal: true

module Markup
  module Rails
    class Engine < ::Rails::Engine
      isolate_namespace Markup::Rails
    end
  end
end
