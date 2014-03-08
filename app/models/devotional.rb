class Devotional < ActiveRecord::Base

  validates :title, presence: true
  validates :content, presence: true
  validates :posted_at, presence: true

end
