module ApplicationHelper
  def date_time(datetime)
    return if datetime.blank?

    datetime.strftime("%d-%B-%Y %H:%M")
  end

  def get_time(datetime)
    return if datetime.blank?

    datetime.strftime("%H:%M")
  end
end
