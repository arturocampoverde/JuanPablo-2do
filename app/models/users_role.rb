class UsersRole < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :user_id, :role_id
  belongs_to :user
  belongs_to :role
  
end
 