class User < ApplicationRecord
  has_many :talks
  has_one :profile, dependent: :destroy
  has_many :comments
  has_many :likes, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, uniqueness: true, presence: true, length: {maximum: 20}
  enum role: { admin: 1, member: 2, company: 3 }
end
