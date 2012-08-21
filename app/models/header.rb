class Header < ActiveRecord::Base
  has_many :headerables
  has_many :emails, :through => :headerables

  attr_accessible :name, :default_value

end
