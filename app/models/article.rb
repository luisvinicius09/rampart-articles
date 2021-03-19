class Article < ApplicationRecord
  validates :image_url, :presence => true

  belongs_to :user
  has_many :votes, foreign_key: :article_id
  belongs_to :category

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }

  scope :business, -> { where('category_id = ?', 1).order(created_at: :desc) }
  scope :sports, -> { where('category_id = ?', 2).order(created_at: :desc) }
  scope :fashion, -> { where('category_id = ?', 3).order(created_at: :desc) }
  scope :entertainment, -> { where('category_id = ?', 4).order(created_at: :desc) }
  scope :most_popular_article, lambda {
    where(id: Article.all.joins(:votes).group(:id).count.sort_by { |_k, v| v }.last.map { |a, _b| a })
  }
end
