module SubmissionsHelper

  def render_delete_submission(submission)
      output_links = ""
      output_links += link_to "Delete", [submission.assignment, submission], method: :delete, class: "text-danger", data: {confirm: "Are you sure you want to delete your work?"}
      output_links.html_safe
  end

end
