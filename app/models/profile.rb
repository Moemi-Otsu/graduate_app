class Profile < ApplicationRecord
  belongs_to :user, optional: true
  validates :age, presence: true
  enum area:{ hokkaido: 0, tohoku: 1, kanto: 2, chubu: 3, kinki: 4, china: 5, kyushu: 6, okinawa: 7 }
end