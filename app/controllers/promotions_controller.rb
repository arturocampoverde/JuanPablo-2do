class PromotionsController < ApplicationController
  
   
  def index
    @promocione= Promocione.find(:all)
    
  end
  
  
  def new
    @promocione= Promocione.new
#    @promocione = Promocione.find(params[:id])
    #@malla = Malla.all(params[:malla])
    @malla = Malla.find(:all)
    #@nivel = Nivel.joins
    #@nivel = Nivel.find.joins(:malla)
  end
    
  
#  malla_id: @malla.id, nivel_id: params[:nivel], asignatura_id: asignatura.to_i
  
  
  def create
#    params[:promocione][:malla]
    @promocione = Promocione.new(params[:promocione])
#    @promocione.malla.create( params[:malla] )
    
       if @promocione.save
     
    redirect_to promotions_menu_principal_admin_path,  :notice => 'PROMOCION CREADA CON EXITO'
   end
  end
    
  
end
