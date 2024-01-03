module RailsCommandPalette
  class Railtie < Rails::Railtie
    ActiveSupport.on_load(:action_controller) do
      ::ActionController::Base.send(:include, RailsCommandPalette::ActionController)
    end
  end
end
