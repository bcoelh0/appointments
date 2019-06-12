module ApplicationHelper
  def formated_date(date)
    return "" if date.nil?
    date.strftime("%d/%m - %k:%M")
  end

  def nav_link(link_text, link_path)
    content_tag(:li, class: "nav-item " + (current_page?(link_path) ? "active" : "")) do
      link_to link_text, link_path, class: "nav-link"
    end
  end
end
