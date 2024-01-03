module CommandPalette
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)
      desc "This generator installs the javascript needed for rails_command_palette."

      def copy_the_javascript
        copy_file "command_palette_controller.js", "app/javascript/controllers/command_palette_controller.js"
        if (Rails.root.join("app/javascript/controllers/index.js")).exist?
          append_to_file "app/javascript/controllers/index.js", 
            %(import CommandPaletteController from "./command_palette_controller"\napplication.register("command-palette", CommandPaletteController)\n)
        else
          say %(Couldn't find "app/javascript/controllers/index.js".), :red
        end
      end
    end
  end
end
