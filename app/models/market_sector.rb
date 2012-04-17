class MarketSector < ActiveRecord::Base
  extend FriendlyId
  attr_accessible :blurb, :body, :name, :subheading, :slug
  has_many :onsite_courses
  has_many :online_courses
  friendly_id :name, use: :slugged
  
end
