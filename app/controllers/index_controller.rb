class IndexController < ApplicationController
      
  def bienvenida
   @cedula=(params[:cedula])
   @contrasena=(params[:contrasena])
  end 
  
  def menu_principal
   @current_time = Time.now
   @cedula=(params[:cedula])
   @contrasena= (params[:contrasena])
  end
  
  
  def menu_principal_admin
   @current_time = Time.now
   @cedula=(params[:cedula])
   @contrasena= (params[:contrasena])         
  end
 
  
end
