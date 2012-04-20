ActiveAdmin.register OnlineLesson do
  config.sort_order = 'position_asc'

  OnlineCourse.all.each do |online_course|
    self.send(:scope, online_course.title) do |online_lessons|
      online_lessons.where(:online_course_id => online_course.id)
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :price
      f.input :online_course
      f.input :video, as: :file
    end
    f.inputs "Content" do
      f.input :description
    end
    f.buttons
  end

  collection_action :sort, :method => :post do
    params[:online_lesson].each_with_index do |id, index|
      OnlineLesson.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end

  index do
    column "Title", :title
    column "Description" do |online_lesson|
      truncate(online_lesson.description, length: 80)
    end
    default_actions
  end
end
