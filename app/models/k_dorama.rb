class KDorama < ApplicationRecord
  has_one_attached :image
  has_many :reviews, dependent: :destroy
  with_options presence: true do
    validates :title
    validates :introduction
    validates :image
    validates :genre
  end

  def self.ransackable_attributes(auth_object = nil)
    ["title", "genre"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
