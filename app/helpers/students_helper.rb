module StudentsHelper

  def roster_header
    cells = ""
    cells += (content_tag(:th, "Name"))
    @assignments.ordered_by_duedate.each do |a|
      cells += (content_tag(:th, a.name))
    end
    cells.html_safe
  end

  def render_student_roster
    output_list = ""
    alphabetized_list.each do |student|
      student_row = content_tag(:td, student.lastname + ", " + student.firstname, class: "student-names")
      Assignment.ordered_by_duedate.each do |assignment|
        submission = student.submission_for(assignment)
        content =  submission ? link_to("Grade: #{submission.grade}", instructor_assignment_submission_path(assignment, submission)) : "Not submitted"
        student_row += content_tag(:td, content)
      end
      output_list += content_tag(:tr, student_row)
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
