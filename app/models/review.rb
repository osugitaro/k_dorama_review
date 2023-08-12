class Review < ApplicationRecord
  belongs_to :k_dorama
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :impression, presence: true
  validates :viewing_status, presence: true
  validates :evaluation, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1,
    allow_blank: true,
  }, presence: true
end
