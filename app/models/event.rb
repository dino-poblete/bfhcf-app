class Event < ActiveRecord::Base

  default_scope -> { order('created_at DESC') }

  validates :title, presence: true
  validates :content, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  mount_uploader :picture, EventUploader


end
