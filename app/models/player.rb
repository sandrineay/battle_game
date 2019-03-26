# frozen_string_literal: true

class Player < ApplicationRecord
  has_many :primary_battles, class_name: 'Battle', foreign_key: 'player_1_id'
  has_many :secondary_battles, class_name: 'Battle', foreign_key: 'player_2_id'

  mount_uploader :picture, PhotoUploader
  validates :name, uniqueness: true, presence: true
  validates :strength_points, presence: true
  validates :intelligence_points, presence: true
  validates :magic_points, presence: true
  validates :strength_points, inclusion: 0..10
  validates :intelligence_points, inclusion: 0..10
  validates :magic_points, inclusion: 0..10
  validate :max_10_points

  def max_10_points
    total_skills = strength_points + intelligence_points + magic_points
    errors.add(:strength_points, 'Skill points > 10') if total_skills > 10
  end

  def score
    skills = [strength_points, intelligence_points, magic_points].shuffle!
    attack_points + skills[0] * 0.8 + skills[1] * 0.7 + skills[2] * 0.9
  end
end
