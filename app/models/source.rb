class Source < ApplicationRecord
  mount_uploader :file, FileUploader

  validates :title, presence: true
end
