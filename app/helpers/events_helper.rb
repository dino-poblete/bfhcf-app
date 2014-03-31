module EventsHelper

  def isEventSameDate?(start_date, end_date)
    format_date_number(start_date) == format_date_number(end_date)
  end

end
