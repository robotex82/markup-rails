module Markup
  module Rails
    module Generators
      class InstallGenerator < ::Rails::Generators::Base
        desc 'Adds the view helper to the application controller'
  
        source_root File.expand_path('../templates', __FILE__)

        def mount_application_view_helper
          inject_into_file 'app/controllers/application_controller.rb', before: "end\n" do
            "  view_helper Markup::Rails::ApplicationViewHelper, as: :markup_helper\n"
          end
        end
      end
    end
  end
end
