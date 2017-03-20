class Image < ApplicationRecord

  attr_reader :file_remote_url

  has_many :imagings
  has_many :galleries, through: :imagings
  belongs_to :user

  validates :file, presence: true
  has_attached_file :file, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :file, content_type: /\Aimage\/.*\z/

  default_scope { order(created_at: :desc) }

  def file_remote_url=(url)
    self.file = URI.parse(url)
    @file_remote_url = url
  end

end
