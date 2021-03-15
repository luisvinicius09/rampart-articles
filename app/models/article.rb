class Article < ApplicationRecord
  belongs_to :user
  has_many :votes, foreign_key: :article_id
  belongs_to :category

end
