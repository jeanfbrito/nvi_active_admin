class MarketSector < ActiveRecord::Base
  extend FriendlyId
  attr_accessible :blurb, :body, :name, :subheading, :slug
  has_many :onsite_courses
  has_many :online_courses
  friendly_id :name, use: :slugged
  

  def has_online?
    self.online_courses.count > 0
  end

  def has_onsite?
    self.onsite_courses.count > 0
  end
  
end
