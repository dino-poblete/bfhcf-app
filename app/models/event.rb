class Event < ActiveRecord::Base

  default_scope -> { order('created_at DESC') }

  validates :title, presence: true,
            uniqueness:  { case_sensitive: false }

  validates :content, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  mount_uploader :picture, EventUploader
  mount_uploader :announcement, EventUploader

end
