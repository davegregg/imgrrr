class Imaging < ApplicationRecord

  belongs_to :gallery
  belongs_to :image

  validates :gallery, presence: true
  validates :image, presence: true
  
end
