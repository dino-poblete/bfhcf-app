class Devotional < ActiveRecord::Base

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  belongs_to :user
  default_scope -> { order('posted_at DESC') }

  validates :title, presence: true,
            uniqueness:  { case_sensitive: false }

  validates :content, presence: true
  validates :posted_at, presence: true,
            uniqueness:  { case_sensitive: false }

  validates :user_id, presence: true

end
