class News < ActiveRecord::Base
  attr_accessible :blurb, :body, :published, :title
end
