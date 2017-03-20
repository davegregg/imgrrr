class Gallery < ApplicationRecord

  belongs_to :user, counter_cache: true
  has_many :imagings
  has_many :images, through: :imagings

  validates :title, presence: true, allow_blank: false
  validates_uniqueness_of :title, scope: :user

  default_scope { order(created_at: :desc) }

end
