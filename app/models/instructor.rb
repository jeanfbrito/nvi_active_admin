class Instructor < ActiveRecord::Base
  attr_accessible :bio, :name, :profile_picture_name, :profile_picture_uid
end
