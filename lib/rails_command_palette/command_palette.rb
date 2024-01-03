module RailsCommandPalette
  class CommandPalette
    include ActionView::Helpers::TagHelper

    def initialize(commands, options = {})
      @commands = flatten_commands(commands)
      @options = options
    end

    def flatten_commands(commands, flattened = [])
      commands.each do |cmd|
        flattened << cmd
        if cmd[:children].present?
          flatten_commands(cmd[:children], flattened)
          cmd[:children] = cmd[:children].map do |childCmd|
            childCmd[:parent] = cmd[:id]
            childCmd[:id]
          end
        end
      end
      flattened
    end

    def to_html
      tag("ninja-keys", @options.merge(
        data: {
          controller: "command-palette",
          command_palette_commands_value: @commands
        }
      ))
    end
  end
end
