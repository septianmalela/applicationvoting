module ApplicationHelper
  def date_time(datetime)
    return if datetime.blank?

    datetime.strftime("%d-%B-%Y %H:%M")
  end

  def get_time(datetime)
    return if datetime.blank?

    datetime.strftime("%H:%M")
  end

  def flash_message
    content_tag :div, class: "flash-messages" do
      flash.map do |key, value|
        content_tag :div, class: "alert alert-#{key.eql?('alert') ? 'danger' : 'success' }" do 
          content_tag(:span, '&times;'.html_safe, class: :close, 'data-dismiss' => 'alert') + value
        end
      end.join().html_safe
    end
  end
end
