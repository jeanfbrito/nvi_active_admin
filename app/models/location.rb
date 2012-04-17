class Location < ActiveRecord::Base
  attr_accessible :city, :name, :state, :street_address, :zip_code
end
