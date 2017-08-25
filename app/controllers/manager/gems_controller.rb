require_dependency "manager/application_controller"

module Manager
  class GemsController < ApplicationController

    def index
    end

    # Execute 'gem environment' command and show the returned info.
    def environment
      @info = Manager::GemEnvironment.new.execute
    end

  end
end
