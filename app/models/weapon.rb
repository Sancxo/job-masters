class Weapon < ApplicationRecord
  has_and_belongs_to_many :hero

  validates :name, presence: true, uniqueness: true, length: {in: 2..50, wrong_length: "Your name should contain between 2 and 50 characters long."}
  validates :weapon_type, presence: true, inclusion: {in: ["offensive", "defensive"], message: "The type should either be 'offensive' or 'defensive'"}
  validates :bonus, presence: true, numericality: { only_integer: true, in: 1..5 }

  has_one_attached :illustration do |a|
    a.variant :miniature, resize_to_limit: [300, 300]
  end
  validates :illustration, content_type: {in: ['image/png', 'image/jpeg', 'image/gif', 'image/webp', 'image/avif'], message: "Not a supported image format. Should be either .png, .jpeg, .gif, .webp or .avif"}
end
