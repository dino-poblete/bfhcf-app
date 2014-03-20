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
end
