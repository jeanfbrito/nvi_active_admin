class OnlineLesson < ActiveRecord::Base
  attr_accessible :description, :online_course_id, :price, :title, :video, :position
  belongs_to :online_course
  acts_as_list scope: :online_course
  swf_accessor :video

  def price
    self.price_in_pennies / 100.0
  end

  def price=(new_price)
    self.price_in_pennies = new_price.to_f * 100
  end
end
