class Article < ApplicationRecord
  belongs_to :author, foreign_key: 'author_id', class_name: 'User'
  has_many :likes, dependent: :destroy
  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { in: 2..5000 }
end
