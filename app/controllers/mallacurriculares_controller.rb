class MallacurricularesController < ApplicationController
  
  
#before_filter :require_login, :only => [:new, :edit, :destroy, :show, :index] # => CONTROLO QUE EL USUARO NO PUEDA VER NADA DE ESTO
#load_and_authorize_resource :only => [:new, :edit, :destroy] CON ESTO DIGO QUE "NO PUEDE VER EL CONTENIDO"
  before_filter :require_login, :only => [:new, :index]
  before_filter :authenticated_admin 
  
  
  def index
   @periodos_count = Periodo.count()
   if @periodos_count > 1
     @ultimo_periodo = Periodo.find(:last)
   else
     @ultimo_periodo = Periodo.find(:first)
   end   
   @mallas = Malla.where(:mall_fech_fin => @ultimo_periodo.period_fech_fin)
  end
   
    
  def new
    @asignatura = Asignatura.all
    @clase = Clase.find(:all)
    @nivel = Nivel.all
    @malla = Malla.new
 #  @nivele = Nivele.find(:all)
  end
       
      

 def create
    @ultimo_periodo = Periodo.find(:last)
    @malla = Malla.where(:clase_id =>params[:clase], :mall_fech_inic => @ultimo_periodo.period_fech_ini)
    if @malla.empty?
       @malla = Malla.new(params[:malla])
       @malla.mall_fech_inic = params[:malla_fech_inic]
       @malla.mall_fech_fin = params[:malla_fech_fin]
       @malla.clase_id = params[:clase]
       if @malla.save
        params[:asignaturas].each do |asignatura|
          Mult.create( malla_id: @malla.id, nivel_id: params[:nivel], asignatura_id: asignatura.to_i)
        end
        redirect_to mallacurriculares_menu_principal_admin_path,  :notice => 'MALLA CREADA CON EXITO'
      end
    else
      @malla = Malla.find(@malla)
       
      if params[:asignaturas].nil?
        redirect_to mallacurriculares_validar_path,  :notice => ''
      else 
        if params[:nivel].nil?
        redirect_to mallacurriculares_validar_path,  :notice => ''        
      else
        params[:asignaturas].each do |asignatura|
        
          Mult.create(malla_id: @malla.id, nivel_id: params[:nivel], asignatura_id: asignatura.to_i)
      end
      redirect_to mallacurriculares_menu_principal_admin_path,  :notice => 'MALLA CREADA CON EXITO'
       end
    end
  end
end

   def edit
    @periodo = Periodo.last
    @clase = Clase.find(:all)
    

    @nivel_actual = Nivel.find(params[:id])
    @mallas = Malla.joins(:nivels => :cursos).where(:nivels => {:id => @nivel_actual.id}, :cursos => {:periodo_id => @periodo.id}).last
    #@mallas = Malla.find(params[:id])
    @nivel = Nivel.joins(:mallas).where(:mallas => {:id => @mallas.id}).uniq
    
    #@asig_actual = Asignatura.joins(:nivels => :cursos).where(:nivels => {:id => @nivel_actual.id}, :cursos => {:periodo_id => @periodo.id}).uniq
    @asig_actual = Asignatura.joins(:mallas).where(:mults => {:nivel_id => @nivel_actual.id, :malla_id => @mallas.id}).uniq
    @asignatura = Asignatura.all
   end
    
   
   def update
     @amn = Mult.where(:nivel_id => params[:nivel_actual], :asignatura_id => params[:asig_actuals])
     @amn.each do |nma|
     @nivel= Mult.find_by_asignatura_id_and_malla_id_and_nivel_id(nma.asignatura_id, nma.malla_id, nma.nivel_id)
     @nivel.destroy
     end
       
     params[:asignaturas].each do |asig|
       @metallica = Mult.new(params[:mults])
       @metallica.asignatura_id = asig
       @metallica.malla_id = params[:malla_actual]
       @metallica.nivel_id = params[:nivel_actual]
       @metallica.save
#       AsignaturasMallasNivel.new(asignatura_id: asig.id, malla_id: params[:malla_actual], nivel_id: params[:nivel_actual])
     end
 redirect_to asignaturas_menu_principal_admin_path, :notice => 'MALLA ACTUALIZADA CON EXITO'
   end    
   
   
     
  
  
  def show 
    @mallas = Malla.find(params[:id])
  end

  
   def destroy
    @malla = Mult.where(:nivel_id => params[:id], :malla_id => params[:malla_id])
    @malla.each do |ma|
      ma.destroy
    end
    
     @malla_elimanada = Malla.find(params[:malla_id])
    redirect_to mallacurriculares_menu_principal_admin_path
  end
   
  
end