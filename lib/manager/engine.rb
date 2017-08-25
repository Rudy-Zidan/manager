module Manager
  class Engine < ::Rails::Engine
    isolate_namespace Manager

    # Load rubygems commands to the app configuration.
    # So it can be executed in rubygems classes /app/rubygems/manager/*
    initializer 'manager.rubygems_commands' do |app|
      app.config.rubygems_commands = {
        gem_environment: 'gem environment'
      }
    end
    
  end
end
