module ApplicationHelper
  def formated_date(date)
    date.strftime("%d/%m - %k:%M")
  end
end
