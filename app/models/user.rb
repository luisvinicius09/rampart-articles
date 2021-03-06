class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, :presence => true
  validates :name, :presence => true

  has_many :articles, foreign_key: :user_id
  has_many :votes, foreign_key: :user_id
end
