module StudentsHelper

  def render_student_roster
    output_list = ""
    alphabetized_list.each do |student|
      output_list += student.lastname + ", " + student.firstname + tag(:br) + tag(:br)
    end
    output_list.html_safe
  end

  def render_student_submission(submission)
    output = ""
    output += submission.assignment.name
    output += ": "
    output += submission.note
    if submission.file?
      output += link_to(render_file_name(submission.file.url), submission.file.url, target: "_blank") + tag(:br)
    end
    output += submission.grade.to_s
    output.html_safe
  end

  private

  def alphabetized_list
    @students.sort_by do |student|
      student.lastname
    end
  end
end
