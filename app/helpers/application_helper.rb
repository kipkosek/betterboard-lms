module ApplicationHelper

  def render_file_name(file)
    file.split("/").last
  end

end
