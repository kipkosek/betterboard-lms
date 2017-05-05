module AssignmentsHelper

  def render_new_link
    if instructor_signed_in?
      link_to "Add New Assignment", new_assignment_path, class: "btn btn-primary"
    end
  end

  def render_edit_delete_assignment(assignment)
      output_links = ""
      output_links += link_to "Edit", edit_assignment_path(assignment), class: "text-warning"
      output_links += " | "
      output_links += link_to "Delete", assignment, method: :delete, class: "text-danger", data: {confirm: "Are you sure you want to delete this assignment?"}
      output_links.html_safe
  end

  def render_new_submission_link
    if student_signed_in?
      link_to "Submit Your Work", new_assignment_submission_path(@assignment), class: "btn btn-primary"
    end
  end

  def render_submission(submission)
      output = ""
      output += content_tag(:h4, submission.note, class: "media heading")
      if submission.file?
        output += link_to(render_file_name(submission.file.url), submission.file.url, target: "_blank") + tag(:br)
      end
      if submission.grade?
        output += content_tag(:h4, submission.grade)
      else
        output += content_tag(:h4, "Not graded")
      end
      output.html_safe
  end


end
