module ApplicationHelper
  def date_time(datetime)
    datetime.strftime("%d-%B-%Y %H:%M")
  end
end
