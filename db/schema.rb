# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110614150004) do

  create_table "areas", :force => true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  create_table "candidatos", :force => true do |t|
    t.string   "nombre"
    t.string   "email"
    t.string   "carrera"
    t.string   "domicilio"
    t.boolean  "empleado_actualmente"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.date     "fecha_nacimiento"
    t.string   "escolaridad"
    t.integer  "promedio"
    t.date     "fecha_ingreso_escuela"
    t.date     "fecha_egreso_escuela"
    t.string   "cursos_conocimientos"
    t.string   "certificaciones"
    t.string   "idiomas"
    t.string   "programas_computacionales"
    t.integer  "sueldo_deseado"
    t.string   "horario"
    t.boolean  "disponibilidad_viaje"
    t.boolean  "cambio_residencia"
    t.string   "tipo_contratacion"
    t.string   "industria"
    t.integer  "industria_experiencia"
    t.string   "area"
    t.integer  "area_experiencia"
    t.string   "areas_interes"
    t.string   "empresa"
    t.string   "puesto"
    t.string   "departamento"
    t.date     "ingreso_empresa"
    t.string   "motivo_separacion"
    t.string   "ref_nombre"
    t.string   "ref_empresa"
    t.string   "ref_puesto"
    t.string   "ref_email"
    t.integer  "telefono",                  :limit => 8
    t.integer  "celular",                   :limit => 8
    t.integer  "ref_telefono",              :limit => 8
    t.string   "curriculum_file_name"
    t.string   "curriculum_content_type"
    t.string   "curriculum_file_size"
  end

  create_table "departamentos", :force => true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "area_id"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  create_table "entrevista", :force => true do |t|
    t.integer  "solicitud_id"
    t.string   "comentarios"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "fecha"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "usuario_id"
    t.integer  "calificacion"
    t.string   "ubicacion"
    t.string   "estatus"
  end

  create_table "posicions", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "area_id"
  end

  create_table "requerimientos", :force => true do |t|
    t.string   "nombre"
    t.string   "tipo"
    t.text     "descripcion"
    t.text     "habilidades"
    t.text     "competencias"
    t.text     "responsabilidades"
    t.string   "estudios"
    t.date     "fecha_contratacion_deseada"
    t.integer  "pago_minimo"
    t.integer  "pago_maximo"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "area_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "estatus"
    t.text     "comentarios_gerente"
    t.text     "comentarios_rh"
    t.boolean  "requiere_viajar"
    t.integer  "posicion_id"
  end

  create_table "rol_asignacions", :force => true do |t|
    t.integer  "usuario_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "titulo"
  end

  create_table "solicituds", :force => true do |t|
    t.integer  "candidato_id"
    t.integer  "vacante_id"
    t.string   "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.string   "nombre"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "user_id"
    t.string   "display_name"
    t.string   "email"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt"
    t.integer  "zona_horaria",      :limit => 8
    t.integer  "departamento_id"
    t.string   "habilidades"
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.integer  "updated_by"
  end

  create_table "vacantes", :force => true do |t|
    t.string   "nombre"
    t.string   "tipo"
    t.boolean  "requiere_viajar"
    t.text     "descripcion"
    t.text     "habilidades"
    t.text     "competencias"
    t.text     "responsabilidades"
    t.string   "estudios"
    t.integer  "requerimiento_id"
    t.date     "fecha_inicio_reclutamiento"
    t.date     "fecha_deseada_contratacion"
    t.date     "fecha_cierre_reclutamiento"
    t.integer  "pago_minimo"
    t.integer  "pago_maximo"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "area_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "estatus"
    t.integer  "usuario_id"
    t.integer  "posicion_id"
  end

end
