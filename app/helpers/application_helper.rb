module ApplicationHelper
  def date_time(datetime)
    datetime.strftime("%d-%B-%Y %H:%M")
  end

  def get_time(datetime)
    datetime.strftime("%H:%M")
  end
end
