require_dependency "manager/application_controller"

module Manager
  class GemsController < ApplicationController
    include GemsHelper
    
    def index
      @info = gem_environment
    end
  end
end
