class Player < ApplicationRecord
  mount_uploader :picture, PhotoUploader
  validates :name, uniqueness: true
end
