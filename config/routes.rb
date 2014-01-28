Base::Application.routes.draw do
  get "password_resets/create"
  get "password_resets/edit"
  get "password_resets/update"

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  
  
  #get "index_menu_principal_profesor" => "index#menu_principal_profesor", :as => "index_menu_principal_profesor"
  get "cursosrealizados_menu_principal_profesor" => "cursosrealizados#menu_principal_profesor", :as => "cursosrealizados_menu_principal_profesor"
  get "secretariasis_menu_principal_secretaria" => "secretariasis#menu_principal_secretaria", :as => "secretariasis_menu_principal_secretaria"
  get "buscar_distributivos" => "secretariasis#result_busqueda", :as => "buscar_distributivos" 
  
  get "secretarias_menu_principal_secretaria" => "secretarias#menu_principal_secretaria", :as => "secretarias_menu_principal_secretaria"
  
  get "buscar_mallas" => "secretariasis#result_busquedamalla", :as => "buscar_mallas"

  get "result_buscar" => "secretariasis#buscar", :as => "result_buscar"
  get "activar" => "secretariasis#activar", :as => "activar"
  get "validar" => "secretariasis#validar", :as => "validar"
  get "edit_matr_alum" => "secretariasis#edit_matr_alum", :as => "edit_matr_alum"
  get "update_matr_alum" => "secretariasis#update_matr_alum", :as => "update_matr_alum"


  get "buscar_estudiantes" => "secretariasis#result_estud", :as => "buscar_estudiantes"
  get "estudiantes_curso" => "secretariasis#estudiantes_curso", :as => "estudiantes_curso"
  
  get "estudiantes_estado" => "secretariasis#estudiantes_estado", :as => "estudiantes_estado"
  get "buscar_estado" => "secretariasis#result_estud_estado", :as => "buscar_estado"
  
  
#  get "buscar_personas" => "secretariasis#result_busquedaestud", :as => "buscar_personas"
  
 # get "index_menu_principal_alumno" => "index#menu_principal_alumno", :as => "index_menu_principal_alumno"    
   get "matriculasacademicas_menu_principal_alumno" => "matriculasacademicas#menu_principal_alumno", :as => "matriculasacademicas_menu_principal_alumno"
   
  
   get "index_menu_principal_admin" => "index#menu_principal_admin", :as => "index_menu_principal_admin"
  
  
  get "asignaturas_menu_principal_admin" => "asignaturas#menu_principal_admin", :as => "asignaturas_menu_principal_admin"
  get "asignaturas_menu_principal_admin_index" => "asignaturas#menu_principal_admin_index", :as => "asignaturas_menu_principal_admin_index"
  get "asignaturas_edit" => "asignaturas#menu_principal_admin_edit", :as => "asignaturas_menu_principal_admin_edit"
      
  
  get "secciones_menu_principal_admin" => "secciones#menu_principal_admin", :as => "secciones_menu_principal_admin"
  get "secciones_edit" => "secciones#menu_principal_admin_edit", :as => "secciones_menu_principal_admin_edit" 
  
   
  get "lectivos_menu_principal_admin" => "lectivos#menu_principal_admin", :as => "lectivos_menu_principal_admin"   
  get "niveles_menu_principal_admin" => "niveles#menu_principal_admin", :as => "niveles_menu_principal_admin"   
  get "tipomallas_menu_principal_admin" => "tipomallas#menu_principal_admin", :as => "tipomallas_menu_principal_admin"  
  get "mallacurriculares_menu_principal_admin" => "mallacurriculares#menu_principal_admin", :as => "mallacurriculares_menu_principal_admin"
  
  get "tiponiveles_menu_principal_admin" => "tiponiveles#menu_principal_admin", :as => "tiponiveles_menu_principal_admin"
    
  get "paralelos_menu_principal_admin" => "paralelos#menu_principal_admin", :as => "paralelos_menu_principal_admin"
  
  get "promotions_menu_principal_admin" => "promotions#menu_principal_admin", :as => "promotions_menu_principal_admin"  
  
  get "malla_asignar" => "mallacurriculares#asignar", :as => "malla_asignar"
  get "malla_eliminar" => "mallacurriculares#destroy", :as => "malla_eliminar"
        
  get "asignaturas/index"
  get "asignaturas/edit" 
  get "asignaturas/show" 

  get "secciones/index"
  get "secciones/edit" 
  get "secciones/show" 
  
  get "lectivos/index"
  get "lectivos/edit" 
  get "lectivos/show" 
  
  
  get "niveles/index"
  get "niveles/edit" 
  get "niveles/show"
  get "niveles/new"
  get "niveles/create"
      
  get "cursosrealizados/index"
  get "cursosrealizados/new"
  get "cursosrealizados/edit" 
  get "cursosrealizados/show"
  get "cursosrealizados/horario"
  
  get "secretarias/ind_distr"
  
#  get "secretariasis/index"
#  get "secretariasis/new"
#  get "secretariasis/edit" 
#  get "secretariasis/show"
#  get "secretariasis/horario"
#  get "secretariasis/ind_distr"
#  get "secretariasis/ind_mall"
#  get "secretariasis/ind_estud"
#  get "secretariasis/ind_estud_estado"    
  
  get "secretarias/curriculsecretari"
  get "secretarias/new"
  get "secretarias/edit" 
  get "secretarias/show"
  get "secretariasis/buscar"
  get "secretariasis/result_buscar"
  #get "secretariasis/activar"

  
  get "tipomallas/index"
  get "tipomallas/edit" 
  get "tipomallas/show"
  
  get "mallacurriculares/index"
  get "mallacurriculares/edit" 
  get "mallacurriculares/show"
  get "mallacurriculares/new"
  get "mallacurriculares/create"
  get "mallacurriculares/update"
  
  get "tiponiveles/index"
  get "tiponiveles/edit" 
  get "tiponiveles/show"
  
  get "paralelos/index"
  get "paralelos/edit" 
  get "paralelos/new"
  get "paralelos/update"
  get "paralelos_index" => "paralelos#index", :as => "paralelos_index"
  
  get "datosalumnos/index" 
  get "datosalumnos/edit"
  
  get "promotions/index"
  get "promotions/edit" 
  get "promotions/new"
  
  get "distributos/index"
  get "distributos/update"
  get "distributos/edit" 
  get "distributos/new"
  get "distributos/update_niveles", :as => "update_niveles"
  get "distributos/update_asignaturas", :as => "update_asignaturas"
  get "distributos/update_cursos", :as => "update_cursos"
  get "distributos_new" => "distributos#new", :as => "distributos_new"
  get "distributos_index" => "distributos#index", :as => "distributos_index"  
  get "distributos_menu_principal_admin" => "distributos#menu_principal_admin", :as => "distributos_menu_principal_admin"

  
  post "mallactual" => "mallacurriculares#update", :as => "mallactual"
  post "datoseditalum" => "datosalumnos#update", :as => "datoseditalum"
#  post "datoseditalum" => "datosalumnos#update", :as => "datoseditalum"
  
  get "matriculasacademicas_new" => "matriculasacademicas#new", :as => "matriculasacademicas_new"

  get "matriculasacademicas_imprimir" => "matriculasacademicas#imprimir", :as => "matriculasacademicas_imprimir"
  
  get "matriculasacademicas/new"
  get "matriculasacademicas/index"
  get "matriculasacademicas/show"  
  
  get "notasasacademicas/new"
  get "notasacademicas/index"
  get "notasasacademicas/consultas_correo"  
  
  get "cursosprofesores/new"
  get "cursosprofesores/index"
  get "cursosprofesores/show"
  get "cursosprofesores/alumnos"
  get "cursosprofesores/edit"
  get "cursosprofesores/update"
  get "cursosprofesores/lista"
    
  get "alumnos_matriculados_lista" => "cursosprofesores#imprimir_lista", :as => "alumnos_matriculados_lista"
  
  get "alumnos_matriculados" => "cursosprofesores#new", :as => "alumnos_matriculados"
  get "edit_alumnos_matriculados" => "cursosprofesores#edit", :as => "edit_alumnos_matriculados"
  post "update_alumnos_matriculados" => "cursosprofesores#update", :as => "update_alumnos_matriculados"
  

  resources :users
  resources :sessions
  resources :asignaturas  
  resources :secciones
  resources :lectivos
  resources :niveles

  resources :personas
  
  resources :cursosrealizados
  resources :secretarias
  resources :tipomallas
  resources :tiponiveles
  resources :mallacurriculares
  resources :paralelos
  resources :promotions
  resources :distributos
  resources :cursosprofesores
#  resources :matriculasacademicas
  
  resources :notasacademicas
    
  resources :password_resets
  
  
  #root :to => "productos#menu_principal"

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
  
#  default_url_options :host => ""

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  
   root :to => 'index#menu_principal'
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.

  match ':controller(/:action(/:id))(.:format)'
  match '/asignaturas/:id', :to => 'asignaturas#show', :as => :asignatura 
  match '/secciones/:id', :to => 'secciones#show', :as => :seccion
  match '/lectivos/:id', :to => 'lectivos#show', :as => :periodo 
  match '/niveles/:id', :to => 'niveles#show', :as => :nivel
      
  match '/cursosrealizados/:id', :to => 'cursosrealizados#edit', :as => :estudio
  match '/cursosrealizados/:id', :to => 'cursosrealizados#edit', :as => :laboral
  
#  match '/secretarias/:id', :to => 'secretarias#curriculsecretari', :as => :estudio
#  match '/secretarias/:id', :to => 'secretarias#curriculsecretari', :as => :laboral
  
  match '/tipomallas/:id', :to => 'tipomallas#show', :as => :clase
  match '/tiponiveles/:id', :to => 'tiponiveles#show', :as => :nivele
  match '/mallacurriculares/:id', :to => 'mallacurriculares#show', :as => :malla
  match '/paralelos/:id', :to => 'paralelos#show', :as => :curso
#  match '/promotions/:id', :to => 'promotions#show', :as => :promocione

  match '/distributos/:id', :to => 'distributos#show', :as => :distributivo
  match '/users/:id', :to => 'users#index', :as => :user
  match '/matriculasacademicas/:id', :to => 'matriculasacademicas#show', :as => :matricula
  match '/cursosprofesores/:id', :to => 'cursosprofesores#show', :as => :calificacione
  
  match '/secretarias/:id', :to => 'secretarias#result_busquedaestud', :as => :persona
#  match '/users/:id', :to => 'users#show', :as => :persona
#  match '/users/:id', :to => 'users#show', :as => :representante
end