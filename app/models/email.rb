class Email < ActiveRecord::Base
  has_many :headerables
  has_many :headers, :through => :headerables
  
  # accepts_nested_attributes_for :headers #, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  accepts_nested_attributes_for :headerables, :reject_if => proc {|attributes| attributes[:value].blank? }, :allow_destroy => true

  
  attr_accessible :subject, :body, :headerables_attributes
end
