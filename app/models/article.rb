class Article < ApplicationRecord
  include Visible
  belongs_to :user # foreign key - user_id
  has_many :comments, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :user_id, presence: true

end