Cameracheck::Application.routes.draw do
  root :to => 'venues#index'
  resources :venues, :except => [:new, :destroy]
end
