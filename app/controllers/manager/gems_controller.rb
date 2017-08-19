require_dependency "manager/application_controller"

module Manager
  class GemsController < ApplicationController
    include GemsHelper

    def index
      
    end

    def environment
      @info = gem_environment
    end
  end
end
