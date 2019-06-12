module ApplicationHelper
  def formated_date(date)
    return "" if date.nil?
    date.strftime("%d/%m - %k:%M")
  end
end
