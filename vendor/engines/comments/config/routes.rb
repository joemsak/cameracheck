Refinery::Application.routes.draw do
  resources :comments

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :comments do
      collection do
        post :update_positions
      end
    end
  end
end
