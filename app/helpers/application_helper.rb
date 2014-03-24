module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Bread From Heaven Christian Fellowship"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def title(page_title = '')
    content_for(:title) { page_title }
  end

  def format_date(date)
    date.strftime("%B %d, %Y %I:%M%p")
  end

  def format_fullmonth_year(date)
    date.strftime("%B %Y")
  end

  def format_short_date(date)
    date.strftime("%B %d, %Y")
  end

  def format_date_number(date)
    date.strftime("%m-%d-%Y")
  end

  def format_date_time(date)
    date.strftime("%l:%m %p")
  end
end
