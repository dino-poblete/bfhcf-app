class Devotional < ActiveRecord::Base

  belongs_to :user
  default_scope -> { order('created_at DESC') }

  validates :title, presence: true,
            uniqueness:  { case_sensitive: false }

  validates :content, presence: true
  validates :posted_at, presence: true
  validates :user_id, presence: true

end
