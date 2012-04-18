class Job < ActiveRecord::Base
  attr_accessible :active, :contact_email, :description, :position
end
