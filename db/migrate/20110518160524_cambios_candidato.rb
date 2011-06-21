class CambiosCandidato < ActiveRecord::Migration
  def self.up
    add_column :candidatos,:fecha_nacimiento,:date
    add_column :candidatos,:escolaridad,:string
    add_column :candidatos,:promedio,:integer
    add_column :candidatos,:fecha_ingreso_escuela,:date
    add_column :candidatos,:fecha_egreso_escuela,:date
    add_column :candidatos,:cursos_conocimientos,:string
    add_column :candidatos,:certificaciones,:string
    add_column :candidatos,:idiomas,:string
    add_column :candidatos,:programas_computacionales,:string
    add_column :candidatos,:sueldo_deseado,:integer
    add_column :candidatos,:horario,:string
    add_column :candidatos,:disponibilidad_viaje,:boolean
    add_column :candidatos,:cambio_residencia,:boolean
    add_column :candidatos,:tipo_contratacion,:string
    add_column :candidatos,:industria,:string
    add_column :candidatos,:industria_experiencia,:integer
    add_column :candidatos,:area,:string
    add_column :candidatos,:area_experiencia,:integer
    add_column :candidatos,:areas_interes,:string
    add_column :candidatos,:empresa,:string
    add_column :candidatos,:puesto,:string
    add_column :candidatos,:departamento,:string
    add_column :candidatos,:ingreso_empresa,:date
    add_column :candidatos,:motivo_separacion,:string
    add_column :candidatos,:ref_nombre,:string
    add_column :candidatos,:ref_empresa,:string
    add_column :candidatos,:ref_puesto,:string
    add_column :candidatos,:ref_email,:string
    add_column :candidatos,:ref_telefono,:integer
    remove_column :candidatos, :escuela
    remove_column :candidatos, :ciudad
    remove_column :candidatos, :proyectos
    remove_column :candidatos, :experiencia
    remove_column :candidatos, :empresa_actual

  end

  def self.down
    
    remove_column :candidatos,:fecha_nacimiento,:date
    remove_column :candidatos,:escolaridad,:string
    remove_column :candidatos,:promedio,:integer
    remove_column :candidatos,:fecha_ingreso_escuela,:date
    remove_column :candidatos,:fecha_egreso_escuela,:date
    remove_column :candidatos,:cursos_conocimientos,:string
    remove_column :candidatos,:certificaciones,:string
    remove_column :candidatos,:idiomas,:string
    remove_column :candidatos,:programas_computacionales,:string
    remove_column :candidatos,:sueldo_deseado,:integer
    remove_column :candidatos,:horario,:string
    remove_column :candidatos,:disponibilidad_viaje,:boolean
    remove_column :candidatos,:cambio_residencia,:boolean
    remove_column :candidatos,:tipo_contratacion,:string
    remove_column :candidatos,:industria,:string
    remove_column :candidatos,:industria_experiencia,:integer
    remove_column :candidatos,:area,:string
    remove_column :candidatos,:area_experiencia,:integer
    remove_column :candidatos,:areas_interes,:string
    remove_column :candidatos,:empresa,:string
    remove_column :candidatos,:puesto,:string
    remove_column :candidatos,:departamento,:string
    remove_column :candidatos,:ingreso_empresa,:date
    remove_column :candidatos,:motivo_separacion,:string
    remove_column :candidatos,:ref_nombre,:string
    remove_column :candidatos,:ref_empresa,:string
    remove_column :candidatos,:ref_puesto,:string
    remove_column :candidatos,:ref_email,:string
    remove_column :candidatos,:ref_telefono,:integer
    add_column :candidatos, :escuela
    add_column :candidatos, :ciudad
    add_column :candidatos, :proyectos
    add_column :candidatos, :experiencia
    add_column :candidatos, :empresa_actual
  end
end
