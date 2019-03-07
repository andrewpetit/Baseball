module ApplicationHelper
  def pretty_datetime datetime
    return if datetime.blank?

    Time.zone.parse(datetime.to_s).strftime('%e %b %Y %l:%M:%S%p')
  end
end
