class Article < ApplicationRecord
  validates :image_url, :presence => true

  belongs_to :user
  has_many :votes, foreign_key: :article_id
  belongs_to :category

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
