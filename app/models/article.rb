class Article < ApplicationRecord
  validates :title, :presence => true
  validates :content, :presence => true
  validates :image_url, :presence => true
  validates :image_url, format: { with: URI.regexp(%w[http https] ), message: 'This not a valid URL'}

  belongs_to :user
  has_many :votes, foreign_key: :article_id
  has_and_belongs_to_many :category

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }

  scope :business, -> { where('category_id = ?', 1).order(created_at: :desc) }
  scope :sports, -> { where('category_id = ?', 2).order(created_at: :desc) }
  scope :fashion, -> { where('category_id = ?', 3).order(created_at: :desc) }
  scope :entertainment, -> { where('category_id = ?', 4).order(created_at: :desc) }
end
