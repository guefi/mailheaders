class Headerable < ActiveRecord::Base
  belongs_to :header
  belongs_to :email
  
  attr_accessible :email_id, :header_id, :value
  
  default_scope joins(:header).order("headers.name")
end
