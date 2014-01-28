class DistributosController < ApplicationController
#before_filter :require_login, :only => [:new, :edit, :destroy, :show, :index] # => CONTROLO QUE EL USUARO NO PUEDA VER NADA DE ESTO
#load_and_authorize_resource :only => [:new, :edit, :destroy] CON ESTO DIGO QUE "NO PUEDE VER EL CONTENIDO"
#before_filter :login_required, :except => ["HOLAAA"]
 before_filter :require_login, :only => [:new, :edit, :destroy, :show, :index]
 before_filter :authenticated_admin




 helper_method :sort_column, :sort_direction
   def new
    @distributo = Distributivo.new
    @periodo = Periodo.find(:last)

    @clase = Clase.find(:all)
    @malla =[]
    @niveles = []
    @asignaturas = []

    @profesores = Persona.joins(:tipos).where(:tipos =>{:tip_descrip => "PROFESOR"}).search(params[:search]).order(sort_column+ ' ' + sort_direction)
    @cursos = Curso.where(:periodo_id => @periodo.id)
  end


   #VALIDANDO PERO ME MOLESTA LOS REDIRECT O RENDER
# def create
#   if params[:cursos_ids].nil?
#     redirect_to distributos_validar_path,  :notice => ''
#   else   
#   params[:cursos_ids].each do |cur|
#      @distributo = Distributivo.new(params[:distributivo])
#      @distributo.persona_id = params[:profesor]
#      curso = Curso.find(cur)
#      if curso.cur_paralelo == "A"
#        @distributo.distr_horarioa = params[:distr_horarioa]
#      end
#      if curso.cur_paralelo == "B"
#        @distributo.distr_horarioa = params[:distr_horariob]
#      end
#      @distributo.curso_id = cur.to_i
#      if @distributo.save
#      redirect_to distributos_new_path,  :notice => 'DISTRIBUTIVO CREADO CON EXITO'    
#      end
#   end      
#   end
#  end
  
 
 
 
 
 
 def create
   params[:cursos_ids].each do |cur|
      @distributo = Distributivo.new(params[:distributivo])
      @distributo.persona_id = params[:profesor]
      curso = Curso.find(cur)
      if curso.cur_paralelo == "A"
        @distributo.distr_horarioa = params[:distr_horarioa]
      end
      if curso.cur_paralelo == "B"
        @distributo.distr_horarioa = params[:distr_horariob]
      end
      @distributo.curso_id = cur.to_i
      if @distributo.save
      end
   end
   redirect_to distributos_new_path,  :notice => 'DISTRIBUTIVO CREADO CON EXITO'
  end
 
 
 
 
  
   def index
     @periodo = Periodo.find(:last)
     @distributos = Distributivo.joins(:curso =>:periodo).where(:periodos => {:id => @periodo.id})

#    @periodo_actual = Periodo.find(:last)
#    @distributos = Distributivo.joins(:curso => :periodo).where(:periodos => {:id => @periodo_actual.id})
   end


   def edit
    @distributos = Distributivo.find(params[:id])
    
    @cursos = Curso.find(:all)
    @periodo = Periodo.last
    @profesores = Persona.joins(:tipos).where(:tipos =>{:tip_descrip => "PROFESOR"}).search(params[:search]).order(sort_column+ ' ' + sort_direction)
    @clase = Clase.find(:all)
    @clase_actual = Clase.joins(:mallas => {:nivels => {:cursos => :distributivos}}).where(:distributivos => {:id => @distributos.id}).uniq.first
    @niveles = Nivel.joins(:mallas => :clase).where(:clases => {:id => @clase_actual.id}).uniq
    @nivel_actual = Nivel.joins(:cursos => :distributivos).where(:distributivos => {:id => @distributos.id}).first

    @malla = Malla.where(:clase_id => @clase_actual.id).last
    @asignaturas = Asignatura.joins(:mallas).where(:mults => {:malla_id => @malla.id, :nivel_id => @nivel_actual.id})
    #@asignaturas = Asignatura.joins(:nivels => {:cursos => :periodo}).where(:nivels => {:id => @nivel_actual.id}, :periodos => {:id => @periodo.id}).uniq
   end


   def update
    @distributos = Distributivo.find(params[:id])
    @distributos.update_attributes(params[:distributivo])
    @distributos.update_attribute(:persona_id, params[:profesor])
    redirect_to asignaturas_menu_principal_admin_path
   end

   
   def update_niveles
    @periodo = Periodo.find(:last)
    malla = Malla.joins(:nivels => {:cursos => :periodo}).where(:clase_id => params[:clase_id], :periodos => {:id => @periodo.id}).last#.pluck("mall_estado")
    nivel = Nivel.joins(:mallas).where(:mallas => {:id => malla.id}).uniq
    @niveles = nivel.map{|c| [c.nivel_numero, c.id]}.insert(0, "Seleccione un Nivel")
   end


   def update_asignaturas
      @periodo = Periodo.find(:last)
      nivel = Nivel.find(params[:nivel_id])
      @cursos = Curso.where(:nivel_id => nivel.id, :periodo_id => @periodo.id)
      malla = Malla.joins(:nivels).where(:nivels => {:id => nivel.id}).last
      asig = Asignatura.joins(:mallas).where(:mults => {:malla_id => malla.id, :nivel_id => nivel.id})
      @asignaturas = asig.map{|p| [p.asig_nombre, p.id]}.insert(0, "Seleccione una Asignatura")
   end


  def destroy
    @distributtos= Distributivo.find(params[:id])
    @distributtos.destroy
    redirect_to asignaturas_menu_principal_admin_path
  end


  private
  def sort_column
    Persona.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end