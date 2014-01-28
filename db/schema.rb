# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20131205050937) do

  create_table "accions", :force => true do |t|
    t.string   "acc_nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "asignaturas", :force => true do |t|
    t.string   "asig_nombre"
    t.string   "asig_abreviat"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "calificaciones", :force => true do |t|
    t.float  "calif_tarea"
    t.float  "calif_act_indv"
    t.float  "calif_act_grup"
    t.float  "calif_leccion"
    t.float  "calif_examen"
    t.float  "calif_total"
    t.float  "calif_promedio"
    t.string   "calif_cualit"
    t.string   "calif_estado"
    t.float  "calif_conducta"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "asignatura_id"
    t.integer  "matricula_id"
  end

  add_index "calificaciones", ["asignatura_id", "matricula_id"], :name => "index_calificaciones_on_asignatura_id_and_matricula_id"

  create_table "clases", :force => true do |t|
    t.string   "tip_mall_descrip"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "cursos", :force => true do |t|
    t.string   "cur_nombre"
    t.string   "cur_paralelo"
    t.integer  "cur_capac"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "promocione_id"
    t.integer  "periodo_id"
    t.integer  "seccion_id"
    t.integer  "nivel_id"
  end

  add_index "cursos", ["promocione_id", "periodo_id", "seccion_id", "nivel_id"], :name => "propeseni"

  create_table "distributivos", :force => true do |t|
    t.date     "distr_fecha"
    t.string   "distr_horarioa"
    t.string   "distr_estado"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "persona_id"
    t.integer  "asignatura_id"
    t.integer  "curso_id"
  end

  add_index "distributivos", ["persona_id", "asignatura_id", "curso_id"], :name => "peracur"

  create_table "estudios", :force => true do |t|
    t.string   "est_nivel"
    t.string   "est_instituto"
    t.string   "est_titulos"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "persona_id"
  end

  add_index "estudios", ["persona_id"], :name => "index_estudios_on_persona_id"

  create_table "laborals", :force => true do |t|
    t.string   "rel_lab_inst_nomb"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "persona_id"
  end

  add_index "laborals", ["persona_id"], :name => "index_laborals_on_persona_id"

  create_table "mallas", :force => true do |t|
    t.string   "mall_estado"
    t.text     "mall_fech_inic"
    t.text     "mall_fech_fin"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "clase_id"
  end

  add_index "mallas", ["clase_id"], :name => "index_mallas_on_clase_id"

  create_table "matriculas", :force => true do |t|
    t.date     "matr_fech"
    t.integer  "matr_folio"
    t.string   "matr_estado"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "curso_id"
    t.integer  "persona_id"
  end

  add_index "matriculas", ["curso_id", "persona_id"], :name => "index_matriculas_on_curso_id_and_persona_id"

  create_table "mults", :force => true do |t|
    t.integer  "asignatura_id"
    t.integer  "malla_id"
    t.integer  "nivel_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "mults", ["asignatura_id", "malla_id", "nivel_id"], :name => "index_mults_on_asignatura_id_and_malla_id_and_nivel_id", :unique => true

  create_table "niveles", :force => true do |t|
    t.string   "tip_niv_nombre"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "nivels", :force => true do |t|
    t.integer  "nivel_numero"
    t.string   "nivel_descrip"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "nivele_id"
  end

  add_index "nivels", ["nivele_id"], :name => "index_nivels_on_nivele_id"

  create_table "periodos", :force => true do |t|
    t.text     "period_fech_ini"
    t.text     "period_fech_fin"
    t.string   "period_estad_lect"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "personas", :force => true do |t|
    t.string   "pers_cedula"
    t.string   "pers_nombre"
    t.string   "pers_apellido"
    t.string   "pers_direccion"
    t.string   "pers_telefono1"
    t.string   "pers_telefono2"
    t.string   "pers_email"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "personas_tipos", :id => false, :force => true do |t|
    t.integer  "persona_id"
    t.integer  "tipo_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "personas_tipos", ["persona_id", "tipo_id"], :name => "index_personas_tipos_on_persona_id_and_tipo_id", :unique => true

  create_table "promociones", :force => true do |t|
    t.string   "promo_descrip"
    t.date     "promo_descrip_fec_ini"
    t.date     "promo_descrip_fech_fin"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "malla_id"
  end

  add_index "promociones", ["malla_id"], :name => "index_promociones_on_malla_id"

  create_table "representantes", :force => true do |t|
    t.string   "repre_parentesco"
    t.string   "repre_estado"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "estudiante_id"
    t.integer  "persona_id"
  end

  add_index "representantes", ["estudiante_id", "persona_id"], :name => "index_representantes_on_estudiante_id_and_persona_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "rol_observ"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "roles_accions", :force => true do |t|
    t.integer  "role_id"
    t.integer  "accion_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "roles_accions", ["role_id", "accion_id"], :name => "index_roles_accions_on_role_id_and_accion_id", :unique => true

  create_table "seccions", :force => true do |t|
    t.string   "secc_nombre"
    t.string   "secc_estado"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tipos", :force => true do |t|
    t.string   "tip_descrip"
    t.string   "tip_estado"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",                        :null => false
    t.string   "email"
    t.string   "usu_estado"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "persona_id"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
  end

  add_index "users", ["persona_id"], :name => "index_users_on_persona_id"
  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token"

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id", :unique => true

end
