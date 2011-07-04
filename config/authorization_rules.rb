authorization do
  
  
  #----- Roles Internos por acción
  
  #- Controlador :Áreas
  
  role :areas_index do
    has_permission_on :areas, :to => :index
  end

  role :areas_show do
    has_permission_on :areas, :to => :show
  end
  
  role :areas_new do
    has_permission_on :areas, :to => :new
  end
  
  role :areas_edit do
    has_permission_on :areas, :to => :edit
  end
  
  role :areas_create do
    has_permission_on :areas, :to => :create
  end
  
  role :areas_update do
    has_permission_on :areas, :to => :update
  end
  
  role :areas_destroy do
    has_permission_on :areas, :to => :destroy
  end
  
  role :areas_autocomplete_usuario_display_name do
    has_permission_on :areas, :to => :autocomplete_usuario_display_name 
  end
  
  role :areas_show_mty do
    has_permission_on :areas do
      to :show
      if_attribute :lugar => "Monterrey"
    end
  end
  
  role :areas_edit_mty do
    has_permission_on :areas do
      to :edit
      if_attribute :lugar => "Monterrey"
    end
  end
  
  role :areas_update_mty do
    has_permission_on :areas do
      to :update
      if_attribute :lugar => "Monterrey"
    end
  end
  
  role :areas_destroy_mty do
    has_permission_on :areas do
      to :destroy
      if_attribute :lugar => "Monterrey"
    end
  end
  
  role :areas_show_df do
    has_permission_on :areas do
      to :show
      if_attribute :lugar => "D.F."
    end
  end
  
  role :areas_edit_df do
    has_permission_on :areas do
      to :edit
      if_attribute :lugar => "D.F."
    end
  end
  
  role :areas_update_df do
    has_permission_on :areas do
      to :update
      if_attribute :lugar => "D.F."
    end
  end
  
  role :areas_destroy_df do
    has_permission_on :areas do
      to :destroy
      if_attribute :lugar => "D.F."
    end
  end
  
  
  
  #- Controlador : Candidatos
  
  role :candidatos_index do
    has_permission_on :candidatos, :to => :index
  end

  role :candidatos_show do
    has_permission_on :candidatos, :to => :show
  end
  
  role :candidatos_new do
    has_permission_on :candidatos, :to => :new
  end
  
  role :candidatos_edit do
    has_permission_on :candidatos, :to => :edit
  end
  
  role :candidatos_create do
    has_permission_on :candidatos, :to => :create
  end
  
  role :candidatos_update do
    has_permission_on :candidatos, :to => :update
  end
  
  role :candidatos_destroy do
    has_permission_on :candidatos, :to => :destroy
  end
  
  role :candidatos_show_area do
    has_permission_on :candidatos do
      to :show
      if_attribute :vacantes => {:area_id => is {Departamento.find(user.departamento_id).area.id}} 
    end  
  end 
  
  role :candidatos_show_mty do
    has_permission_on :candidatos do
      to :show
      if_attribute :vacantes => {:area => {:lugar =>  "Monterrey"}}
    end
  end
  
  role :candidatos_show_df do
    has_permission_on :candidatos do
      to :show
      if_attribute :vacantes => {:area => {:lugar => "D.F."}}
    end
  end
  
  role :candidatos_edit_mty do
    has_permission_on :candidatos do
      to :edit
      if_attribute :vacantes => {:area => {:lugar =>  "Monterrey"}}
    end
  end
  
  role :candidatos_update_mty do
    has_permission_on :candidatos do
      to :update
      if_attribute :vacantes => {:area => {:lugar =>  "Monterrey"}}
    end
  end
  
  role :candidatos_destroy_mty do
    has_permission_on :candidatos do
      to :destroy
      if_attribute :vacantes => {:area => {:lugar =>  "Monterrey"}}
    end
  end
  
  role :candidatos_edit_df do
    has_permission_on :candidatos do
      to :edit
      if_attribute :vacantes => {:area => {:lugar => "D.F."}}
    end
  end
  
  role :candidatos_update_df do
    has_permission_on :candidatos do
      to :update
      if_attribute :vacantes => {:area => {:lugar => "D.F."}}
    end
  end
  
  role :candidatos_destroy_df do
    has_permission_on :candidatos do
      to :destroy
      if_attribute :vacantes => {:area => {:lugar => "D.F."}}
    end
  end
  
  #- Controlador: Departamentos
  
  role :departamentos_index do
    has_permission_on :departamentos, :to => :index
  end

  role :departamentos_show do
    has_permission_on :departamentos, :to => :show
  end
  
  role :departamentos_new do
    has_permission_on :departamentos, :to => :new
  end
  
  role :departamentos_edit do
    has_permission_on :departamentos, :to => :edit
  end
  
  role :departamentos_create do
    has_permission_on :departamentos, :to => :create
  end
  
  role :departamentos_update do
    has_permission_on :departamentos, :to => :update
  end
  
  role :departamentos_destroy do
    has_permission_on :departamentos, :to => :destroy
  end
  
  role :departamentos_autocomplete_usuario_display_name do
    has_permission_on :departamentos, :to => :autocomplete_usuario_display_name 
  end
  
   role :departamentos_edit_mty do
    has_permission_on :departamentos do
      to :edit
      if_attribute :area => {:lugar => "Monterey" }
    end
  end
  
  role :departamentos_update_mty do
    has_permission_on :departamentos do
      to :update
      if_attribute :area => {:lugar => "Monterey" }
    end
  end
  
  role :departamentos_destroy_mty do
    has_permission_on :departamentos do
      to :destroy
      if_attribute :area => {:lugar => "Monterey" }
    end
  end
  
  role :departamentos_edit_df do
    has_permission_on :departamentos do
      to :edit
      if_attribute :area => {:lugar => "D.F." }
    end
  end
  
  role :departamentos_update_df do
    has_permission_on :departamentos do
      to :update
      if_attribute :area => {:lugar => "D.F." }
    end
  end
  
  role :departamentos_destroy_df do
    has_permission_on :departamentos do
      to :destroy
      if_attribute :area => {:lugar => "D.F." }
    end
  end
  
  role :departamentos_show_mty do
    has_permission_on :departamentos do
      to :show
      if_attribute :area => {:lugar => "Monterey" }
    end
  end
  
  role :departamentos_show_df do
    has_permission_on :departamentos do
      to :show
      if_attribute :area => {:lugar => "D.F." }
    end
  end
  
  #- Controlador: Entrevista 
  
  role :entrevista_index do
    has_permission_on :entrevista, :to => :index
  end

  role :entrevista_show do
    has_permission_on :entrevista, :to => :show
  end
  
  role :entrevista_new do
    has_permission_on :entrevista, :to => :new
  end
  
  role :entrevista_edit do
    has_permission_on :entrevista, :to => :edit
  end
  
  role :entrevista_create do
    has_permission_on :entrevista, :to => :create
  end
  
  role :entrevista_update do
    has_permission_on :entrevista, :to => :update
  end
  
  role :entrevista_destroy do
    has_permission_on :entrevista, :to => :destroy
  end
  
  role :entrevista_autocomplete_solicitud_nombre do
    has_permission_on :entrevista, :to => :autocomplete_solicitud_nombre
  end
  
  role :entrevista_autocomplete_usuario_display_name do
    has_permission_on :entrevista, :to => :autocomplete_usuario_display_name 
  end
  
  role :entrevista_cancelar do
    has_permission_on :entrevista, :to => :cancelar
  end
  
  role :entrevista_calificar do
    has_permission_on :entrevista, :to => :calificar
  end
  
  role :entrevista_show_entrevistador do
    has_permission_on :entrevista do
      to :show 
      if_attribute :usuario_id => is {user.id}
    end
  end
  
  role :entrevista_calificar_entrevistador do
    has_permission_on :entrevista do
      to :calificar
      if_attribute :usuario_id => is {user.id}
    end
  end
  
  role :entrevista_update_entrevistador do
    has_permission_on :entrevista do
      to :update 
      if_attribute :usuario_id => is {user.id}
    end
  end

  role :entrevista_show_creador do
    has_permission_on :entrevista do
      to :show
      if_attribute :solicitud => { :vacante => {:requerimiento => {:created_by =>  is {user.id} }}}         
    end  
  end
  
  role :entrevista_edit_creador do
    has_permission_on :entrevista do
      to :edit
      if_attribute :solicitud => { :vacante => {:requerimiento => {:created_by =>  is {user.id} }}}         
    end  
  end
  
  role :entrevista_update_creador do
    has_permission_on :entrevista do
      to :update
      if_attribute :solicitud => { :vacante => {:requerimiento => {:created_by =>  is {user.id} }}}
    end
  end
  
  role :entrevista_cancelar_creador do 
    has_permission_on :entrevista do
      to :cancelar
      if_attribute :solicitud => { :vacante => {:requerimiento => {:created_by =>  is {user.id} }}}
    end
  end
  
  role :entrevista_edit_area do 
    has_permission_on :entrevista do
      to :edit
      if_attribute :solicitud => { :vacante => {:area_id  =>  is {Departamento.find(user.departamento_id).area.id}}}
    end
  end
  
  role :entrevista_update_area do 
    has_permission_on :entrevista do
      to :update
      if_attribute :solicitud => { :vacante => {:area_id  =>  is {Departamento.find(user.departamento_id).area.id}}}
    end
  end
  
  role :entrevista_destroy_area do 
    has_permission_on :entrevista do
      to :destroy
      if_attribute :solicitud => { :vacante => {:area_id  =>  is {Departamento.find(user.departamento_id).area.id}}}
    end
  end
  
  role :entrevista_cancelar_area do 
    has_permission_on :entrevista do
      to :cancelar
      if_attribute :solicitud => { :vacante => {:area_id  =>  is {Departamento.find(user.departamento_id).area.id}}}
    end
  end
  
  role :entrevista_edit_mty do 
    has_permission_on :entrevista do
      to :edit
      if_attribute :area => {:lugar => "Monterrey"}
    end
  end
  
  role :entrevista_update_mty do 
    has_permission_on :entrevista do
      to :update
      if_attribute :area => {:lugar => "Monterrey"}
    end
  end
  
  role :entrevista_destroy_mty do 
    has_permission_on :entrevista do
      to :destroy
      if_attribute :area => {:lugar => "Monterrey"}
    end
  end
  
  role :entrevista_cancelar_mty do 
    has_permission_on :entrevista do
      to :cancelar
      if_attribute :area => {:lugar => "Monterrey"}
    end
  end
  
    role :entrevista_edit_df do 
    has_permission_on :entrevista do
      to :edit
      if_attribute :area => {:lugar => "D.F."}
    end
  end
  
  role :entrevista_update_df do 
    has_permission_on :entrevista do
      to :update
      if_attribute :area => {:lugar => "D.F."}
    end
  end
  
  role :entrevista_destroy_df do 
    has_permission_on :entrevista do
      to :destroy
      if_attribute :area => {:lugar => "D.F."}
    end
  end
  
  role :entrevista_cancelar_df do 
    has_permission_on :entrevista do
      to :cancelar
      if_attribute :area => {:lugar => "D.F."}
    end
  end
  
  #- Controlador : Posicions
  
  role :posicions_index do
    has_permission_on :posicions, :to => :index
  end

  role :posicions_show do
    has_permission_on :posicions, :to => :show
  end
  
  role :posicions_new do
    has_permission_on :posicions, :to => :new
  end
  
  role :posicions_edit do
    has_permission_on :posicions, :to => :edit
  end
  
  role :posicions_create do
    has_permission_on :posicions, :to => :create
  end
  
  role :posicions_update do
    has_permission_on :posicions, :to => :update
  end
  
  role :posicions_destroy do
    has_permission_on :posicions, :to => :destroy
  end
  
  role :posicions_show_area do
    has_permission_on :posicions do
      to :show      
      if_attribute :area_id => is {Departamento.find(user.departamento_id).area.id} 
    end
  end
  
  role :posicions_show_mty do
    has_permission_on :posicions do
      to :show      
      if_attribute :area => {:lugar =>  "Monterrey"}
    end
  end
  
  role :posicions_show_df do
    has_permission_on :posicions do
      to :show      
      if_attribute :area => {:lugar =>  "D.F."}
    end
  end
  
  #- Controlador : Requerimientos
  
  role :requerimientos_index do
    has_permission_on :requerimientos, :to => :index
  end

  role :requerimientos_show do
    has_permission_on :requerimientos, :to => :show
  end
  
  role :requerimientos_new do
    has_permission_on :requerimientos, :to => :new
  end
  
  role :requerimientos_edit do
    has_permission_on :requerimientos, :to => :edit
  end
  
  role :requerimientos_create do
    has_permission_on :requerimientos, :to => :create
  end
  
  role :requerimientos_update do
    has_permission_on :requerimientos, :to => :update
  end
  
  role :requerimientos_destroy do
    has_permission_on :requerimientos, :to => :destroy
  end
  
  role :requerimientos_autocomplete_posicion_nombre do
    has_permission_on :requerimientos, :to => :autocomplete_posicion_nombre
  end
  
  role :requerimientos_aprobar do
    has_permission_on :requerimientos, :to => :aprobar
  end
  
  role :requerimientos_rechazar do
    has_permission_on :requerimientos, :to => :rechazar
  end
  
  role :requerimientos_rechazar_rh do
    has_permission_on :requerimientos, :to => :rechazar_rh
  end

  role :requerimientos_convertir do
    has_permission_on :requerimientos, :to => :convertir
  end

  role :requerimientos_convertir_vacante do
    has_permission_on :requerimientos, :to => :convertir_vacante
  end
  
  role :requerimientos_cancelar do
    has_permission_on :requerimientos, :to => :cancelar
  end
  
  role :requerimientos_show_area do
    has_permission_on :requerimientos do
      to :show
      if_attribute :area_id => is {Departamento.find(user.departamento_id).area.id}
    end
  end
  
  role :requerimientos_edit_creador do
    has_permission_on :requerimientos do
      to :edit
      if_attribute :created_by => is {user.id}
    end
  end
  
  role :requerimientos_update_creador do
    has_permission_on :requerimientos do
      to :update
      if_attribute :created_by => is {user.id}
    end
  end
  
  role :requerimientos_cancelar_creador do
    has_permission_on :requerimientos do
      to :cancelar
      if_attribute :created_by => is {user.id}
    end
  end
  
  role :requerimientos_show_mty do
    has_permission_on :requerimientos do
      to :show
      if_attribute :area => {:lugar => "Monterrey" }
    end
  end
  
  role :requerimientos_show_df do
    has_permission_on :requerimientos do
      to :show
      if_attribute :area => {:lugar => "D.F." }
    end
  end
  
  role :requerimientos_aprobar_area do
    has_permission_on :requerimientos do
      to :aprobar
      if_attribute :area_id => is {Departamento.find(user.departamento_id).area.id}
    end
  end
  
  role :requerimientos_rechazar_area do
    has_permission_on :requerimientos do
      to :rechazar
      if_attribute :area_id => is {Departamento.find(user.departamento_id).area.id}
    end
  end
  
  role :requerimientos_edit_area do
    has_permission_on :requerimientos do
      to :edit
      if_attribute :area_id => is {Departamento.find(user.departamento_id).area.id}
    end
  end
  
  role :requerimientos_update_area do
    has_permission_on :requerimientos do
      to :show
      if_attribute :area_id => is {Departamento.find(user.departamento_id).area.id}
    end
  end
  
  role :requerimientos_destroy_area do
    has_permission_on :requerimientos do
      to :destroy
      if_attribute :area_id => is {Departamento.find(user.departamento_id).area.id}
    end
  end
  
  role :requerimientos_edit_mty do
    has_permission_on :requerimientos do
      to :edit
      if_attribute :area => {:lugar => "Monterrey" }
    end
  end
  
  role :requerimientos_update_mty do
    has_permission_on :requerimientos do
      to :update
      if_attribute :area => {:lugar => "Monterrey" }
    end
  end
  
  role :requerimientos_destroy_mty do
    has_permission_on :requerimientos do
      to :destroy
      if_attribute :area => {:lugar => "Monterrey" }
    end
  end
  
  role :requerimientos_edit_df do
    has_permission_on :requerimientos do
      to :edit
      if_attribute :area => {:lugar => "D.F." }
    end
  end
  
  role :requerimientos_update_df do
    has_permission_on :requerimientos do
      to :update
      if_attribute :area => {:lugar => "D.F." }
    end
  end
  
  role :requerimientos_destroy_df do
    has_permission_on :requerimientos do
      to :destroy
      if_attribute :area => {:lugar => "D.F." }
    end
  end
  
  role :requerimientos_convertir_mty do
    has_permission_on :requerimientos do
      to :convertir
      if_attribute :area => {:lugar => "Monterrey" }
    end
  end
  
  role :requerimientos_rechazar_rh_mty do
    has_permission_on :requerimientos do
      to :rechazar_rh
      if_attribute :area => {:lugar => "Monterrey" }
    end
  end
  
  role :requerimientos_convertir_vacante_mty do
    has_permission_on :requerimientos do
      to :convertir_vacante
      if_attribute :area => {:lugar => "Monterrey" }
    end
  end
  
  role :requerimientos_convertir_df do
    has_permission_on :requerimientos do
      to :convertir
      if_attribute :area => {:lugar => "D.F." }
    end
  end
  
  role :requerimientos_rechazar_rh_df do
    has_permission_on :requerimientos do
      to :rechazar_rh
      if_attribute :area => {:lugar => "D.F." }
    end
  end
  
  role :requerimientos_convertir_vacante_df do
    has_permission_on :requerimientos do
      to :convertir_vacante
      if_attribute :area => {:lugar => "D.F." }
    end
  end
  
  #- Controlador : Solicituds
  
  role :solicituds_index do
    has_permission_on :solicituds, :to => :index
  end
  
  role :solicituds_show do
    has_permission_on :solicituds, :to => :show
  end
  
  role :solicituds_new do
    has_permission_on :solicituds, :to => :new
  end
  
  role :solicituds_edit do
    has_permission_on :solicituds, :to => :edit
  end
  
  role :solicituds_create do
    has_permission_on :solicituds, :to => :create
  end
  
  role :solicituds_update do
    has_permission_on :solicituds, :to => :update
  end
  
  role :solicituds_destroy do
    has_permission_on :solicituds, :to => :destroy
  end
  
  role :solicituds_autocomplete_candidato_nombre do
    has_permission_on :solicituds, :to => :cancelar
  end
  
  role :solicituds_autocomplete_vacante_nombre do
    has_permission_on :solicituds, :to => :autocomplete_vacante_nombre
  end
  
  role :solicituds_show_creador do
    has_permission_on :solicituds do
      to :show
      if_attribute :vacante => {:requerimiento => {:created_by =>  is {user.id} }}
    end
  end

  role :solicituds_show_mty do
    has_permission_on :solicituds do
      to :show
      if_attribute :area => {:lugar => "Monterey" }
    end
  end
  
  role :solicituds_show_df do
    has_permission_on :solicituds do
      to :show
      if_attribute :area => {:lugar => "D.F." }
    end
  end
  
  role :solicituds_edit_mty do
    has_permission_on :solicituds do
      to :edit
      if_attribute :area => {:lugar => "Monterey" }
    end
  end
  
  role :solicituds_update_mty do
    has_permission_on :solicituds do
      to :update
      if_attribute :area => {:lugar => "Monterey" }
    end
  end
  
  role :solicituds_destroy_mty do
    has_permission_on :solicituds do
      to :destroy
      if_attribute :area => {:lugar => "Monterey" }
    end
  end
  
  role :solicituds_edit_df do
    has_permission_on :solicituds do
      to :edit
      if_attribute :area => {:lugar => "D.F." }
    end
  end
  
  role :solicituds_update_df do
    has_permission_on :solicituds do
      to :update
      if_attribute :area => {:lugar => "D.F." }
    end
  end
  
  role :solicituds_destroy_df do
    has_permission_on :solicituds do
      to :destroy
      if_attribute :area => {:lugar => "D.F." }
    end
  end
  
  #- Controlador: Usuarios
  
  role :usuarios_index do
    has_permission_on :usuarios, :to => :index
  end
  
  role :usuarios_show do
    has_permission_on :usuarios, :to => :show
  end
  
  role :usuarios_edit do
    has_permission_on :usuarios, :to => :edit
  end
  
  role :usuarios_create do
    has_permission_on :usuarios, :to => :create
  end
  
  role :usuarios_update do
    has_permission_on :usuarios, :to => :update
  end
  
  role :usuarios_destroy do
    has_permission_on :usuarios, :to => :destroy
  end
  
  role :usuarios_asignar_roles do
    has_permission_on :usuarios, :to => :asignar_roles
  end
  
  role :usuarios_edit_yo do
    has_permission_on :usuarios do
      to :edit
      if_attribute :id => is {user.id}
    end
  end
  
  role :usuarios_update_yo do
    has_permission_on :usuarios do
      to :update
      if_attribute :id => is {user.id}
    end
  end

  role :usuarios_asignar_roles_mty do
    has_permission_on :usuarios do
      to :asignar_roles
      if_attribute :area => {:lugar => "Monterrey" }
    end
  end
  
  role :usuarios_edit_mty do
    has_permission_on :usuarios do
      to :edit
      if_attribute :area => {:lugar => "Monterrey" }
    end
  end
  
  role :usuarios_update_mty do
    has_permission_on :usuarios do
      to :update
      if_attribute :area => {:lugar => "Monterrey" }
    end
  end
  
  role :usuarios_asignar_roles_df do
    has_permission_on :usuarios do
      to :asignar_roles
      if_attribute :area => {:lugar => "D.F" }
    end
  end
  
  role :usuarios_edit_df do
    has_permission_on :usuarios do
      to :edit
      if_attribute :area => {:lugar => "D.F" }
    end
  end
  
  role :usuarios_update_df do
    has_permission_on :usuarios do
      to :update
      if_attribute :area => {:lugar => "D.F" }
    end
  end
  
  #- Contralador : Vacantes
  
  role :vacantes_index do
    has_permission_on :vacantes, :to => :index
  end
  
  role :vacantes_show do
    has_permission_on :vacantes, :to => :show
  end
  
  role :vacantes_new do
    has_permission_on :vacantes, :to => :new
  end
  
  role :vacantes_edit do
    has_permission_on :vacantes, :to => :edit
  end
  
  role :vacantes_create do
    has_permission_on :vacantes, :to => :create
  end
  
  role :vacantes_update do
    has_permission_on :vacantes, :to => :update
  end
  
  role :vacantes_destroy do
    has_permission_on :vacantes, :to => :destroy
  end
  
  role :vacantes_autocomplete_posicion_nombre do
    has_permission_on :vacantes, :to => :autocomplete_posicion_nombre
  end
  
  role :vacantes_cerrar do
    has_permission_on :vacantes, :to => :cerrar
  end
  
  role :vacantes_show_area do
    has_permission_on :vacantes do
      to :show
      if_attribute :area_id => is {Departamento.find(user.departamento_id).area.id}
    end
  end
  
  role :vacantes_show_mty do
    has_permission_on :vacantes do
      to :show
      if_attribute :area => {:lugar => "Monterrey" }
    end
  end
  
  role :vacantes_show_df do
    has_permission_on :vacantes do
      to :show
      if_attribute :area => {:lugar => "D.F." }
    end
  end
  
  role :vacantes_cerrar_area do
    has_permission_on :vacantes do
      to :cerrar
      if_attribute :area_id => is {Departamento.find(user.departamento_id).area.id}
    end
  end
  
  role :vacantes_cerrar_mty do
    has_permission_on :vacantes do
      to :cerrar
      if_attribute :area => {:lugar => "Monterrey" }
    end
  end
  
  role :vacantes_cerrar_df do
    has_permission_on :vacantes do
      to :cerrar
      if_attribute :area => {:lugar => "D.F." }  
    end
  end
  
  role :vacantes_edit_mty do
    has_permission_on :vacantes do
      to :edit
      if_attribute :area => {:lugar => "Monterrey" }
    end
  end
  
  role :vacantes_update_mty do
    has_permission_on :vacantes do
      to :update
      if_attribute :area => {:lugar => "Monterrey" }
    end
  end
  
  role :vacantes_destroy_mty do
    has_permission_on :vacantes do
      to :destroy
    end
  end
  
  role :vacantes_edit_df do
    has_permission_on :vacantes do
      to :edit
      if_attribute :area => {:lugar => "D.F." }
    end
  end
  
  role :vacantes_update_df do
    has_permission_on :vacantes do
      to :update
      if_attribute :area => {:lugar => "D.F." }
    end
  end
  
  role :vacantes_destroy_df do
    has_permission_on :vacantes do
      to :destroy
      if_attribute :area => {:lugar => "D.F." }
    end
  end
  
  #----- Roles Internos por Controlador
  
  #- Controlador : Areas
  
  role :areas_general do
    includes [:areas_index,:areas_show,:areas_new,:areas_edit,:areas_create,:areas_update,:areas_destroy,
      :areas_autocomplete_usuario_display_name]
  end
  
  role :areas_mty do
    includes [:areas_index,:areas_show_mty,:areas_new,:areas_edit_mty,:areas_create,:areas_update_mty,:areas_destroy_mty,
      :areas_autocomplete_usuario_display_name]
  end
  
  role :areas_df do
    includes [:areas_index,:areas_show_df,:areas_new,:areas_edit_df,:areas_create,:areas_update_df,:areas_destroy_df,
      :areas_autocomplete_usuario_display_name]
  end
  
  role :areas_mostrar do
    includes [:areas_show,:areas_index]
  end
  
  #- Controlador : Candidatos
  
  role :candidatos_general do
    includes [:candidatos_index,:candidatos_create,:candidatos_show,:candidatos_update,:candidatos_destroy,:candidatos_new,
      :candidatos_edit]
  end
  
  role :candidatos_df do
    includes [:candidatos_index,:candidatos_create,:candidatos_show_mty,:candidatos_update_mty,:candidatos_destroy_mty,
      :candidatos_new,:candidatos_edit_mty]
  end
  
  role :candidatos_mty do
    includes [:candidatos_index,:candidatos_create,:candidatos_show_df,:candidatos_update_df,:candidatos_destroy_df,
      :candidatos_new,:candidatos_edit_df]
  end
  
  #- Controlador : Departamentos
  
  role :departamentos_general do
    includes [:departamentos_index,:departamentos_show,:departamentos_new,:departamentos_edit,:departamentos_create,
      :departamentos_update,:departamentos_destroy,:departamentos_autocomplete_usuario_display_name]
  end
  
  role :departamentos_mty do
    includes [:departamentos_index,:departamentos_show_mty,:departamentos_new,:departamentos_edit_mty,
      :departamentos_create,:departamentos_update_mty,:departamentos_destroy_mty,
      :departamentos_autocomplete_usuario_display_name]
  end
  
  role :departamentos_df do
    includes [:departamentos_index,:departamentos_show_df,:departamentos_new,:departamentos_edit_df,
      :departamentos_create,:departamentos_update_df,:departamentos_destroy_df,
      :departamentos_autocomplete_usuario_display_name]
  end
  
  #- Controlador : Entrevista
  
  role :entrevista_general do
    includes [:entrevista_index,:entrevista_show,:entrevista_create,:entrevista_update,:entrevista_destroy,
      :entrevista_new,:entrevista_edit,:entrevista_autocomplete_solicitud_nombre,:entrevista_cancelar,:entrevista_calificar,
      :entrevista_autocomplete_usuario_display_name]
  end
  
  role :entrevista_entrevistador do
    includes [:entrevista_index,:entrevista_show_entrevistador,:entrevista_calificar_entrevistador,:entrevista_update_entrevistador,
      :entrevista_autocomplete_solicitud_nombre,:entrevista_autocomplete_usuario_display_name]
  end
  
  role :entrevista_creador do
    includes [:entrevista_show_creador,:entrevista_edit_creador,:entrevista_update_creador,:entrevista_cancelar_creador,
      :entrevista_autocomplete_solicitud_nombre,:entrevista_autocomplete_usuario_display_name,:entrevista_create,
      :entrevista_new]
  end
  
  role :entrevista_area do
    includes [:entrevista_edit_area,:entrevista_update_area,:entrevista_destroy_area,:entrevista_cancelar_area,
      :entrevista_autocomplete_solicitud_nombre,:entrevista_autocomplete_usuario_display_name]
  end
  
  role :entrevista_mty do
    includes [:entrevista_edit_mty,:entrevista_update_mty,:entrevista_destroy_mty,:entrevista_cancelar_mty,
      :entrevista_autocomplete_solicitud_nombre,:entrevista_autocomplete_usuario_display_name]
  end
  
  role :entrevista_df do
    includes [:entrevista_edit_df,:entrevista_update_df,:entrevista_destroy_df,:entrevista_cancelar_df,
      :entrevista_autocomplete_solicitud_nombre,:entrevista_autocomplete_usuario_display_name]
  end
  
  #- Controlador : Posicions
  
  role :posicions_general do
    includes [:posicions_index,:posicions_show,:posicions_create,:posicions_edit,:posicions_destroy,:posicions_new,
      :posicions_update]
  end
  
  #- Controlador : Requerimientos
  
  role :requerimientos_general do
    includes [:requerimientos_index,:requerimientos_show,:requerimientos_update,:requerimientos_edit,:requerimientos_new,
      :requerimientos_create,:requerimientos_destroy,:requerimientos_autocomplete_posicion_nombre,:requerimientos_aprobar,
      :requerimientos_rechazar,:requerimientos_rechazar_rh,:requerimientos_convertir,:requerimientos_convertir_vacante,
      :requerimientos_cancelar]
  end
  
  role :requerimientos_creador do
    includes [:requerimientos_edit_creador,:requerimientos_update_creador,:requerimientos_cancelar_creador,
      :requerimientos_autocomplete_posicion_nombre,:requerimientos_create,:requerimientos_new,:requerimientos_show_area]
  end
  
  role :requerimientos_area do
    includes [:requerimientos_show_area,:requerimientos_edit_area,:requerimientos_update_area,:requerimientos_destroy_area,
      :requerimientos_aprobar_area,:requerimientos_rechazar_area,:requerimientos_autocomplete_posicion_nombre]
  end
  
  role :requerimientos_mty do
    includes [:requerimientos_show_mty,:requerimientos_edit_mty,:requerimientos_update_mty,:requerimientos_destroy_mty,
      :requerimientos_convertir_mty,:requerimientos_rechazar_rh_mty,:requerimientos_convertir_vacante_mty,
      :requerimientos_autocomplete_posicion_nombre]
  end
  
  role :requerimientos_df do
    includes [:requerimientos_show_df,:requerimientos_edit_df,:requerimientos_update_df,:requerimientos_destroy_df,
      :requerimientos_convertir_df,:requerimientos_rechazar_rh_df,:requerimientos_convertir_vacante_df,
      :requerimientos_autocomplete_posicion_nombre]
  end
  
  role :requerimientos_rh do
    includes [:requerimientos_convertir,:requerimientos_rechazar_rh,:requerimientos_convertir_vacante,
      :requerimientos_autocomplete_posicion_nombre]
  end
  
  role :requerimientos_rh_mty do
    includes [:requerimientos_convertir_mty,:requerimientos_rechazar_rh_mty,:requerimientos_convertir_vacante_mty,
      :requerimientos_autocomplete_posicion_nombre]
  end
  
  role :requerimientos_rh_df do
    includes [:requerimientos_convertir_df,:requerimientos_rechazar_rh_df,:requerimientos_convertir_vacante_df,
      :requerimientos_autocomplete_posicion_nombre]
  end
  
  #- Controlador : Solicituds
  
  role :solicituds_general do
    includes [:solicituds_index,:solicituds_show,:solicituds_new,:solicituds_edit,:solicituds_create,:solicituds_update,
      :solicituds_destroy,:solicituds_autocomplete_candidato_nombre,:solicituds_autocomplete_vacante_nombre]
  end
  
  role :solicituds_mty do
    includes [:solicituds_show_mty,:solicituds_edit_mty,:solicituds_update_mty,:solicituds_destroy_mty,:solicituds_index,
      :solicituds_create,:solicituds_new,:solicituds_autocomplete_candidato_nombre,:solicituds_autocomplete_vacante_nombre]
  end
  
  role :solicituds_df do
    includes [:solicituds_show_df,:solicituds_edit_df,:solicituds_update_df,:solicituds_destroy_df,:solicituds_index,
      :solicituds_create,:solicituds_new,:solicituds_autocomplete_candidato_nombre,:solicituds_autocomplete_vacante_nombre]
  end
  
  #- Controlador : Usuarios
  
  role :usuarios_general do
    includes [:usuarios_index,:usuarios_show,:usuarios_edit,:usuarios_update,:usuarios_asignar_roles]
  end
  
  role :usuarios_yo do
    includes [:usuarios_edit_yo,:usuarios_update_yo,:usuarios_index,:usuarios_show]
  end
  
  role :usuarios_mty do
    includes [:usuarios_asignar_roles_mty,:usuarios_edit_mty,:usuarios_update_mty]
  end
  
  role :usuarios_df do
    includes [:usuarios_asignar_roles_df,:usuarios_edit_df,:usuarios_update_df]
  end
  
  #- Controlador : Vacantes
  
  role :vacantes_general do
    includes [:vacantes_index,:vacantes_show,:vacantes_create,:vacantes_edit,:vacantes_update,:vacantes_destroy,
      :vacantes_new,:vacantes_autocomplete_posicion_nombre]
  end
  
  role :vacantes_area do
    includes [:vacantes_show_area,:vacantes_cerrar_area,:vacantes_autocomplete_posicion_nombre]
  end
  
  role :vacantes_mty do
    includes [:vacantes_show_mty,:vacantes_cerrar_mty,:vacantes_edit_mty,:vacantes_update_mty,:vacantes_destroy_mty,
      :vacantes_index,:vacantes_create,:vacantes_new]
  end
  
  role :vacantes_df do
    includes [:vacantes_show_df,:vacantes_cerrar_df,:vacantes_edit_df,:vacantes_update_df,:vacantes_destroy_df,
      :vacantes_index,:vacantes_create,:vacantes_new]
  end
  
  #----- Roles Externos
  
  role :empleado do
    includes [:entrevista_entrevistador,:usuarios_yo,:departamentos_show,:areas_mostrar,:vacantes_index,
      :requerimientos_index,:candidatos_index,:solicituds_index,:posicions_index]
  end
  
  role :jefe_de_departamento do
    includes [:empleado,:candidatos_show_area,:solicituds_show_creador,:entrevista_creador,:vacantes_show_area,
      :posicions_show_area]
  end
  
  role :gerente_de_area do
    includes [:jefe_de_departamento,:requerimientos_area,:entrevista_area,:vacantes_cerrar_area]
  end
  
  role :gerente_de_relaciones_humanas do
    includes [:gerente_de_area,:candidatos_general,:solicituds_general,:vacantes_general,:departamentos_general,
      :areas_general,:usuarios_general,:requerimientos_rh]
  end
  
  role :gerente_de_relaciones_humanas_MTY do
    includes [:gerente_de_area,:candidatos_mty,:vacantes_mty,:requerimientos_rh_mty,:usuarios_mty,:areas_mty,
      :departamentos_mty,:solicituds_mty]
  end
  
  role :gerente_de_relaciones_humanas_DF do
    includes [:gerente_de_area,:candidatos_df,:vacantes_df,:requerimientos_rh_df,:usuarios_df,:areas_df,
      :departamentos_df,:solicituds_df]
  end
  
  role :gerente_general do
    has_omnipotence
  end
  
  role :administrador do
    has_omnipotence
  end
  
  
end