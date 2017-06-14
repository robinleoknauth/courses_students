class Student
  attr_reader :first_name, :last_name, :courses

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @courses = []
  end

  def courses
    @courses
  end

  def name
    @name = "#{first_name} #{last_name}"
  end

  def enroll(new_course)
    return if courses.include?(new_course)
    if self.has_conflict?(new_course)
      raise "Your enrollment conflicts with another class!"
    end
    @courses << new_course
    new_course.students << self
  end

  def course_load
    course_list = Hash.new(0)
    @courses.each do |course|
      course_list[course.department] += course.credits
    end
    course_list
  end

  def has_conflict?(new_course)
    self.courses.each do |course|
      return true if course.conflicts_with?(new_course)
    end
    false
  end
end
