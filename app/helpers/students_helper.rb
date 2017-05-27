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

  def render_submission_for_student(submission)
    output = ""
    output += content_tag(:h4, submission.assignment.name, class: "media-heading")
    output += submission.note + tag(:br)
    if submission.file?
      output += link_to(render_file_name(submission.file.url), submission.file.url, target: "_blank") + tag(:br)
    end
    output += "Submitted at #{submission.created_at}" + tag(:br)
    if submission.grade?
      output += content_tag(:h4, "Grade: #{submission.grade}")
    else
      output += content_tag(:h4, "Not graded", class: "text-danger")
    end
    if submission.feedback?
      output += content_tag(:h4, "Instructor Comments: #{submission.feedback}") + tag(:br)
    end
    output.html_safe
  end

  private

  def alphabetized_list
    @students.sort_by do |student|
      student.lastname
    end
  end

end
