class HealthStrengthRatioValidator < ActiveModel::Validator
  def validate(hero)
    unless (hero.health + hero.strength) == 20 
      hero.error.add :health, :wrong_ratio, message: "You have to spend a total of twenty points between your hero's health and strength."
      hero.error.add :strength, :wrong_ratio, message: "You have to spend a total of twenty points between your hero's health and strength."
    end
  end
end

class Hero < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: {in: 2..50, wrong_length: "Your name should contain between 2 and 50 characters long."}

  validates :health, presence: true, numericality: { only_integer: true }
  validates :strength, presence: true, numericality: { only_integer: true }

  validates_with HealthStrengthRatioValidator

  has_one_attached :avatar do |a|
    a.variant :profile, resize_to_limit: [300, 300]
  end
  validates :avatar, content_type: {in: ['image/png', 'image/jpeg', 'image/gif', 'image/webp', 'image/avif'], message: "Not a supported image format. Should be either .png, .jpeg, .gif, .webp or .avif"}
end
