authorization do
  
  role :administrador do
    title "Administrador del sistema"
    description "Usuario que se encarga del sistema y cuenta con todos los privilegios
    dentro del sistema"
    has_omnipotence    
  end
    
  role :empleado do
    title "Empleado"
    description "Usuario que sólo cuenta con privilegios para ver solamente las listas resumidas
    de todos los objetos del sistema. No puede crear nada ni ver el detalle de ningún registro.
    La unica información que puede editar es su propia información de usuario y algunos campos
    de una entrevista si es el entrevistador."
    
    has_permission_on [:vacantes,:requerimientos,:candidatos,
                      :solicituds,:posicions], :to => :index                      
    has_permission_on :usuarios, :to => [:index, :show]
    has_permission_on :areas, :to => [:show,:index]
    has_permission_on :departamentos, :to => :show
    has_permission_on :usuarios do
      to :edit,:update
      if_attribute :id => is {user.id}
    end
    has_permission_on :entrevista do
      to [:show,:calificar,:update]
      if_attribute :usuario_id => is {user.id}
    end
  end
  
  role :jefe_departamento do
    title "Jefe de Departamento"
    description "Usuario que cuenta con todos los privilegios del empleado. Puede ver el detalle de los
    requerimientos y vacantes que pertenezcan al área donde trabaja, así como el de los candidatos que
    se encuentren ligados a estas.Puede ver las solicitudes que pertenezcan a vacantes que vengan de
    requerimientos creados por él. Además, puede crear requerimientos y agendar entrevistas para una vacante 
    cuyo requerimiento haya sido creado por él. También, puede editar los requerimientos que hayan sido creados
    por él."
    includes :empleado
    has_permission_on [:requerimientos,:vacantes,:posicions] do
      to :show
      if_attribute :area_id => is {Departamento.find(user.departamento_id).area.id}
    end
    has_permission_on :candidatos do
      to :show
      if_attribute :vacantes => {:area_id => is {Departamento.find(user.departamento_id).area.id} }
    end
    has_permission_on :solicituds do
      to :show
      if_attribute :vacante => {:requerimiento => {:created_by =>  is {user.id} }}
    end
    has_permission_on :entrevista do
      to [:show,:edit,:update,:cancelar]
      if_attribute :solicitud => { :vacante => {:requerimiento => {:created_by =>  is {user.id} }}}
    end
    has_permission_on [:requerimientos,:entrevista], :to => [:create,:new]
    has_permission_on :requerimientos do
      to [:edit,:update,:cancelar]
      if_attribute :created_by => is {user.id}
    end
  end
  
  role :jefe_departamento_mty do
    includes :empleado
    has_permission_on [:requerimientos,:vacantes,:posicions] do
      to :show      
      if_attribute :area => {:lugar => is {"Monterrey"}},:area_id => is {Departamento.find(user.departamento_id).area.id}
    end
    has_permission_on :candidatos do
      to :show
      if_attribute :vacantes => {:area_id => is {Departamento.find(user.departamento_id).area.id}},:area => {:lugar => is {"Monterrey"}}
    end
    has_permission_on :solicituds do
      to :show
      if_attribute :vacante => {:requerimiento => {:created_by =>  is {user.id} }}
    end
    has_permission_on :entrevista do
      to [:show,:edit,:update,:cancelar]
      if_attribute :solicitud => { :vacante => {:requerimiento => {:created_by =>  is {user.id} }}}
    end
    has_permission_on [:requerimientos,:entrevista], :to => [:create,:new]
    has_permission_on :requerimientos do
      to [:edit,:update,:cancelar]
      if_attribute :created_by => is {user.id}
    end
  end
  
  role :jefe_departamento_df do
    includes :empleado
    has_permission_on [:requerimientos,:vacantes,:posicions] do
      to :show      
      if_attribute :area => {:lugar => is {"D.F."}},:area_id => is {Departamento.find(user.departamento_id).area.id}
    end
    has_permission_on :candidatos do
      to :show
      if_attribute :vacantes => {:area_id => is {Departamento.find(user.departamento_id).area.id}},:area => {:lugar => is {"D.F."}}
    end
    has_permission_on :solicituds do
      to :show
      if_attribute :vacante => {:requerimiento => {:created_by =>  is {user.id} }}
    end
    has_permission_on :entrevista do
      to [:show,:edit,:update,:cancelar]
      if_attribute :solicitud => { :vacante => {:requerimiento => {:created_by =>  is {user.id} }}}
    end
    has_permission_on [:requerimientos,:entrevista], :to => [:create,:new]
    has_permission_on :requerimientos do
      to [:edit,:update,:cancelar]
      if_attribute :created_by => is {user.id}
    end
  end
  
  role :gerente_area do
    title "Gerente de área"
    description "Usuario que cuenta con todos los privilegios del jefe de departamento. Es el encargado de 
    aprobar/cancelar los requerimientos solicitados por jefes de departamentos de su área. Además, puede editar  
    y eliminar tanto requerimientos como entrevistas si pertenecen a su área. Puede cerrar el proceso de
    reclutamiento para una vacante que pertenezca a su área."
    includes :jefe_departamento
    has_permission_on :requerimientos do
      to [:aprobar,:rechazar]
      if_attribute :area_id => is {Departamento.find(user.departamento_id).area.id}
    end
    has_permission_on :requerimientos do
      to [:edit,:update,:destroy]
      if_attribute :area_id => is {Departamento.find(user.departamento_id).area.id}
    end
    has_permission_on :entrevista do
      to [:edit,:update,:destroy,:cancelar]
      if_attribute :solicitud => { :vacante => {:area_id  =>  is {Departamento.find(user.departamento_id).area.id}}}
    end
    has_permission_on :vacantes do
      to :cerrar
      if_attribute :area_id => is {Departamento.find(user.departamento_id).area.id}
    end
  end
  
  role :gerente_area_mty do
    includes :jefe_departamento_mty
    has_permission_on :requerimientos do
      to [:aprobar,:rechazar]
      if_attribute :area_id => is {Departamento.find(user.departamento_id).area.id}, :area => {:lugar => "Monterrey"}
    end
    has_permission_on :requerimientos do
      to [:edit,:update,:destroy]
      if_attribute :area_id => is {Departamento.find(user.departamento_id).area.id}, :area => {:lugar => "Monterrey"}
    end
    has_permission_on :entrevista do
      to [:edit,:update,:destroy,:cancelar]
      if_attribute :solicitud => { :vacante => {:area_id  =>  is {Departamento.find(user.departamento_id).area.id}}},
      :area => {:lugar => "Monterrey"}
    end
    has_permission_on :vacantes do
      to :cerrar
      if_attribute :area_id => is {Departamento.find(user.departamento_id).area.id}, :area => {:lugar => "Monterrey"}
    end
  end
  
  role :gerente_area_df do
    includes :jefe_departamento_df
    has_permission_on :requerimientos do
      to [:aprobar,:rechazar]
      if_attribute :area_id => is {Departamento.find(user.departamento_id).area.id}, :area => {:lugar => "D.F."}
    end
    has_permission_on :requerimientos do
      to [:edit,:update,:destroy]
      if_attribute :area_id => is {Departamento.find(user.departamento_id).area.id}, :area => {:lugar => "D.F."}
    end
    has_permission_on :entrevista do
      to [:edit,:update,:destroy,:cancelar]
      if_attribute :solicitud => { :vacante => {:area_id  =>  is {Departamento.find(user.departamento_id).area.id}}},
      :area => {:lugar => "D.F."}
    end
    has_permission_on :vacantes do
      to :cerrar
      if_attribute :area_id => is {Departamento.find(user.departamento_id).area.id}, :area => {:lugar => "D.F."}
    end
  end
  
  role :gerente_rh do
    title "Gerente de Recursos Humanos"
    description "Usuario que cuenta con los privilegios del gerente de área.
    Además, cuenta con privilegios totales sobre los candidatos, las vacantes y las solicitudes. 
    Puede cambiar la configuración de departamentos y áreas del sistema. 
    Es el encargado de convertir un requerimiento aprobado por un gerente de área en una vacante."
    includes :gerente_area
    has_permission_on [:candidatos,:solicituds,:vacantes,:departamentos,:areas], :to => [:index,:show,:edit,:update,:destroy,:create,:new]
    has_permission_on :vacantes, :to => :cerrar
    has_permission_on [:requerimientos], :to => [:convertir,:rechazar_rh,:convertir_vacante]
    has_permission_on [:usuarios], :to => [:asignar_roles,:edit,:update]
    
  end
  
  role :gerente_rh_mty do    
    includes :gerente_area_mty
    has_permission_on [:candidatos,:solicituds,:vacantes,:departamentos,:areas], :to => [:index,:create,:new]
    has_permission_on :candidatos do
      to :show
      if_attribute :vacantes => {:area => {:lugar => "Monterrey"}}
    end
    has_permission_on [:candidatos,:solicituds,:vacantes,:departamentos] do
      to [:edit,:update,:destroy]
      if_attribute :area => {:lugar => "Monterey" }
    end
    has_permission_on :areas do
      to [:show,:edit,:update,:destroy]
      if_attribute :lugar => "Monterey" 
    end
    has_permission_on :vacantes do
      to  :cerrar
      if_attribute :area => {:lugar => "Monterey" }
    end
    has_permission_on :requerimientos do
      to  [:convertir,:rechazar_rh,:convertir_vacante]
      if_attribute :area => {:lugar => "Monterey" }
    end
    has_permission_on :usuarios do 
      to [:asignar_roles,:edit,:update]
      if_attribute :areas => {:lugar => "Monterey" }
    end
    
  end
  
  role :gerente_rh_df do    
    includes :gerente_area_df
    has_permission_on [:candidatos,:solicituds,:vacantes,:departamentos,:areas], :to => [:index,:create,:new]
    has_permission_on [:candidatos,:solicituds,:vacantes,:departamentos] do
      to [:show,:edit,:update,:destroy]
      if_attribute :area => {:lugar => "D.F." }
    end
    has_permission_on :candidatos do
      to :show
      if_attribute :vacantes => {:areas => {:lugar => "D.F."}}
    end
    has_permission_on :areas do
      to [:edit,:update,:destroy]
      if_attribute :lugar => "D.F." 
    end
    has_permission_on :vacantes do
      to  :cerrar
      if_attribute :area => {:lugar => "Monterey" }
    end
    has_permission_on :requerimientos do
      to  [:convertir,:rechazar_rh,:convertir_vacante]
      if_attribute :area => {:lugar => "Monterey" }
    end
    has_permission_on :usuarios do 
      to [:asignar_roles,:edit,:update]
      if_attribute :areas => {:lugar => "Monterey" }
    end
    
  end
  
  
  
  role :gerente_general do
    title "Gerente General"
    description "Usuario que cuenta con todos los privilegios del sistema."
    has_omnipotence   
  end
    
  
end