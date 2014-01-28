class ApplicationController < ActionController::Base
#  protect_from_forgery
   
#  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  def render_404
    respond_to do |format|
      format.html { render :action => "/404.html.erb", :status => 404 }
      # and so on..
    end
  end
  
  
  
  def not_authenticated
  redirect_to login_url, :alert => ".logeate"
  end
  
  
  
   def authenticated_alum
     if current_user.has_role? :alumno 
     else
     redirect_to login_url, :alert => ".alum"
     end
   end
   
   
   # def url_correcta     
#   if @estudios.nil? and @laborals.nil?
#       render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false             
#   end
# end
  
    
   
   def authenticated_prof
     if current_user.has_role? :profesor 
     else     
     redirect_to login_url, :alert => ".prof"
     end
   end
   
   
  def authenticated_secreta
     if current_user.has_role? :secretaria 
     else     
     redirect_to login_url, :alert => ".secre"
     end
   end
    
    
#   
   def authenticated_admin
     if current_user.has_role? :admin
     else
     redirect_to login_url, :alert => ".admin"
     end
   end
#   
   
#   ME IMPIDE RESTAURAR LA SESION CUANDO LE DOY CLIC EN ANTERIOR
#  before_filter :set_cache_buster
#  def set_cache_buster
#    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
#    response.headers["Pragma"] = "no-cache"
#    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
#  end
   
  
end
