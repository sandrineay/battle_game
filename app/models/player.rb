class Player < ApplicationRecord
  mount_uploader :picture, PhotoUploader
  validates :name, uniqueness: true, presence: true
  validates :picture, presence: true
  validates :strength_points, inclusion: 1..10
  validates :intelligence_points, inclusion: 1..10
  validates :magic_points, inclusion: 1..10
  validate :max_10_points

  def max_10_points
    if strength_points + intelligence_points + magic_points > 10
      errors.add(:strength_points, 'The total of all the points - strength, intelligence and magic - should not exceed 10.')
    end
  end
end
