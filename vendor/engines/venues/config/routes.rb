Refinery::Application.routes.draw do
  resources :venues do
    resources :comments
  end

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :venues do
      collection do
        post :update_positions
      end
    end
  end
end
