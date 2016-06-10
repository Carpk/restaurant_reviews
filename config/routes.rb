Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  resources :welcome, only: [:index]
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end
  resources :blogs, only: [:index, :show]
  resources :lists, only: [:index, :show]
  resources :categories, only: [:show]
  resources :reviews, only: [:index]

  resources :restaurants, only: [:index, :show] do
    resources :reviews, only: [:index, :show]
  end

  resources :admins, only: [:show] do
    resources :restaurants, except: [:index, :show] do
      resources :lists, only: [:new]
      resources :reviews do
        resources :pictures, only: [:new, :create]
      end
    end
    resources :reviews, only: [] do
      resources :lists, only: [:new]
    end
    resources :categories, except: [:show, :new]
    resources :lists, except: [:index, :show, :new]
    resources :blogs, except: [:index, :show]
  end

  # Example resource route with sub-resources:
    # resources :products do
    #   resources :comments, :sales
    #   resource :seller
    # end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
