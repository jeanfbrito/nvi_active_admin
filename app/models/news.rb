class News < ActiveRecord::Base
  attr_accessible :blurb, :body, :published, :title
  scope :published, where(published: true)
end
