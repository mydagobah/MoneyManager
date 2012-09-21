class Money < ActiveRecord::Base
  attr_accessible :description, :user_id, :value
  
  belongs_to :user
end
