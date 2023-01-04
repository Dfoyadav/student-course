module ApplicationHelper
  def select_course
  	Course.all.map {[course] [course.course.name,course.id]}
  end
end
