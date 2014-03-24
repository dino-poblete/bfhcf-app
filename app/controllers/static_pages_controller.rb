class StaticPagesController < ApplicationController

  def home

    today_date = Time.now.strftime("%Y-%m-%d")
    today_month_year = Time.now.strftime("%Y-%m")

    @events = Event.where("strftime('%Y-%m', start_date) = ?", today_month_year)

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
end
