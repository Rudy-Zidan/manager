module Manager
  class Engine < ::Rails::Engine
    isolate_namespace Manager
    initializer "Manager.assets.precompile" do |app|
      app.config.assets.paths << Rails.root.join("app", "assets", "fonts")
      app.config.assets.precompile += %w( .svg .eot .woff .ttf)
    end
  end
end
