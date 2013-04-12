class Image < ActiveRecord::Base
  attr_accessible :file

  belongs_to :project
  mount_uploader :file, ImageUploader

end
