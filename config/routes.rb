Manager::Engine.routes.draw do
  get '/', to: 'gems#index', as: 'manager'
  get '/environment', to: 'gems#environment', as: 'gem_environment'
end
