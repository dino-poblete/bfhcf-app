class Gallery < ActiveRecord::Base

  #attr_accessible :body, :content_type, :images_attributes, :published, :slug, :title
  validates :title, presence: true,
            uniqueness:  { case_sensitive: false }

  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true

end
