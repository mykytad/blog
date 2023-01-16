class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end