class User < ApplicationRecord
  has_many :articles  #foreign key - artisle_id
  has_many :comments  #foreign key - comment_id
  include Gravtastic
  gravtastic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end