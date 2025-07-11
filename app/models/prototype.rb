class Prototype < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy

    # Active Storage のアソシエーション
    has_one_attached :image

      # バリデーション
  validates :catch_copy, :concept, :image, presence: true

  validates :title, presence: true, length: { maximum: 20 }
  validates :catch_copy, presence: true, length: { maximum: 100 }
  validates :concept, presence: true, length: { maximum: 500 }
  validates :image, presence: true
  
end
