class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles, foreign_key: 'author_id', class_name: 'Article'
  has_many :likes, dependent: :destroy
  validates :name, presence: true, length: { minimum: 2 }
end
