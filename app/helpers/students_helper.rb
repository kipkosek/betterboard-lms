module StudentsHelper

  def render_student_roster
    output_list = ""
    alphabetized_list.each do |student|
      output_list += student.lastname + ", " + student.firstname + tag(:br) + tag(:br)
    end
    output_list.html_safe
  end


  private

  def alphabetized_list
    @students.sort_by do |student|
      student.lastname
    end
  end
end
