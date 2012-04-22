ActiveAdmin.register OnsiteLesson do
  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :price
      f.input :down_payment_price
    end
    f.inputs "Onsite Lesson Location Data" do
      f.has_many :onsite_lesson_locations do |oll|
        oll.input :date
        oll.input :start_time
        oll.input :seats_remaining
      end
    end
    f.buttons
  end
end
