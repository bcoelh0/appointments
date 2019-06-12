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

  def alert_box(type, notice)
    return unless notice.present?
    content_tag(:div, class: "alert alert-#{type} alert-dismissible fade show", role: "alert") do
      content_tag(:p, notice, style: "margin-bottom: 0") +
      content_tag(:button, class: "close", "aria-label" => "Close", "data-dismiss" => "alert", :type => "button") do
        content_tag(:span, " × ", "aria-hidden" => "true")
      end
    end
  end
end
