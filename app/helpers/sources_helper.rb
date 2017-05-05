module SourcesHelper

  def render_resource_for(source)
    output = ""
    output += tag(:hr)
    output += content_tag(:h4, source.title, class: "media heading")
    output += content_tag(:p, source.description)
    if source.file?
      output += link_to(render_file_name(source.file.url), source.file.url, target: "_blank") + tag(:br)
    end
    if source.link?
      output += link_to(source.link, target: "_blank") + tag(:br)
    end
    if source.youtube?
      id = source.youtube.split("?v=")[1]
      output += "<iframe width=560, height=315, src='http://www.youtube.com/embed/#{id}', frameborder=0, allowfullscreen=true></iframe>"
    end
    output.html_safe
  end

  def render_new_source_link
    if instructor_signed_in?
      link_to "Add New Source", new_source_path, class: "btn btn-primary"
    end
  end

  def render_edit_delete_source(source)
    if instructor_signed_in?
      output_links = ""
      output_links += link_to "Edit", edit_source_path(source), class: "text-warning"
      output_links += " | "
      output_links += link_to "Delete", source, method: :delete, class: "text-danger", data: {confirm: "Are you sure you want to delete this source?"}
      output_links.html_safe
    end

  end
end
