Refinery::Application.routes.draw do
  resources :venues

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :venues do
      collection do
        post :update_positions
      end
    end
  end
end
