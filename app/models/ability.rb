class Ability
  include CanCan::Ability


  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
      else
    
      if user.has_role? :alumno
        can :edit, :show, :new, :index                            
       else
   
          if user.has_role? :profesor
          can :edit, :show, :new, :index                              
          else
              
            if user.has_role? :secretaria
            can :edit, :new, :show
            end
          end
      end 
    end
  end
end


