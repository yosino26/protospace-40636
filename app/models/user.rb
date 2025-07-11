class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :name, presence: true, length: { maximum: 15 }
         validates :email, presence: true, uniqueness: true
         validates :password, length: { minimum: 6 },

         has_many :comments, dependent: :destroy
         has_many :prototypes, dependent: :destroy
end
