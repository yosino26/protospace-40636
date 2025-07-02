class Prototype < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy

    # Active Storage のアソシエーション
    has_one_attached :image

      # バリデーション
  validates :title, :catch_copy, :concept, :image, presence: true
  
end
