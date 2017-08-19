Rails.application.routes.draw do
  mount Manager::Engine => "/manager"
end
