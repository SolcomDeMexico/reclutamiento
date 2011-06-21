Reclutamiento::Application.routes.draw do
  resources :entrevista
  resources :solicituds
  resources :candidatos
  resources :vacantes
  resources :requerimientos  
  resources :departamentos
  resources :areas
  resources :posicions
  
  
  resources :usuarios ,:only => [:show,:edit,:update,:index]
    
match '/home', :to => 'sesion#home' 
match '/login', :to => 'sesion#login'
match '/logout', :to => 'sesion#destroy'
match '/aprobar_requerimiento',:to => 'requerimientos#aprobar'
match '/convertir_requerimiento',:to => 'requerimientos#convertir'
match '/convertir_vacante', :to => 'requerimientos#convertir_vacante'
match '/cancelar_requerimiento',:to => 'requerimientos#cancelar'
match '/rechazar_requerimiento',:to => 'requerimientos#rechazar'
match '/rechazar_rh_requerimiento',:to => 'requerimientos#rechazar_rh'
match '/calificar_entrevista', :to => 'entrevista#calificar'
match '/cancelar_entrevista', :to => 'entrevista#cancelar'
match '/cerrar_vacante', :to => 'vacantes#cerrar'
match '/oauth/callback', :to => 'sesion#create'
 #match '/auth/failure', :to => 'sesion#fail'
 

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => "paginas#home"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
