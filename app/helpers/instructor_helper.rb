module InstructorHelper

  def render_submission_for_grade(submission)
    output = ""
    output += content_tag(:li, submission.assignment.name)
    output += content_tag(:li, submission.note)
    if submission.file?
      output += content_tag(:li, link_to(render_file_name(submission.file.url), submission.file.url, target: "_blank"))
    end
    if submission.grade?
      output += content_tag(:li, submission.grade.to_s)
    end
    if submission.feedback?
      output += content_tag(:li, submission.feedback)
    end
    output.html_safe
  end

end
