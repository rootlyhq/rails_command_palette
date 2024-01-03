module RailsCommandPalette
  module ActionController
    extend ActiveSupport::Concern

    included do |base|
      helper HelperMethods
      helper_method :add_command, :prepend_command, :commands

      unless base.respond_to?(:before_action)
        base.alias_method :before_action, :before_filter
      end
    end

    protected

    def commands
      @command_palette_commands ||= []
    end

    def add_command(id:, title:, href: nil, frame: nil, hotkey: nil, icon: nil, section: nil, parent: nil, children: nil, **options)
      commands << {id:, title:, href:, frame:, hotkey:, icon:, section:, parent:, children:, options:}
    end

    def prepend_command(id:, title:, href: nil, frame: nil, hotkey: nil, icon: nil, section: nil, parent: nil, children: nil, **options)
      commands.unshift({id:, title:, href:, frame:, hotkey:, icon:, section:, parent:, children:, options:})
    end

    module HelperMethods
      def command_palette(options = {})
        CommandPalette.new(commands, options).to_html
      end
    end
  end
end
