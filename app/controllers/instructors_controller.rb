class InstructorsController < InheritedResources::Base
  set_tab :instructors

  def index
    @instructors = Instructor.order('id asc')
  end
end
