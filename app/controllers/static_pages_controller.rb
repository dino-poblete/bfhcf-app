class StaticPagesController < ApplicationController

  def home

    today_date = Time.now.strftime("%Y-%m-%d")
    todayMonth = Time.now.strftime("%m")
    todayYear = Time.now.strftime("%Y")

    todayMonthFirstDay = Time.now.at_beginning_of_month.strftime("%Y-%m-%d")
    @events = get_all_current_events(todayMonthFirstDay)

    #@events = get_event_month(todayMonth, todayYear)

    @post = Post.new
    @devotional = Devotional.new

    @latest_post = Post.first

    latest_devotional = Devotional.find_by_posted_at(today_date)
    if latest_devotional.blank?
      previous_devotional = Devotional.where("posted_at < ?", today_date)
      @latest_devotional = previous_devotional.first
    else
      @latest_devotional = latest_devotional
    end

  end

  def about
  end

  def schedule
  end

  private

  def get_event_month(month, year)
    Event.where("extract(year from start_date) = ? and extract(month from start_date) = ?", year, month)
  end

  def get_all_current_events(month)
    Event.where("start_date > ?", month)
  end

end
