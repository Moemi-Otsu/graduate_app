class Profile < ApplicationRecord
  belongs_to :user, optional: true
  validates :age, presence: true
  enum area:{ hokkaido: 0, tohoku: 1, kanto: 2, chubu: 3, kinki: 4, chugoku: 5, kyushu: 6, okinawa: 7 }
  enum occupation:{ sales: 0, accounting: 1, planning_management: 2, administration_assistant: 3, sales_service: 4, professional: 5, financial_professionals: 6, public_servants: 7, teachers_agriculture: 8, technical: 9, medical: 10, creative: 11 }
  enum industry:{ it_communication: 0, internet_advertising: 1, manufacturer_mechanical_electric: 2, manufacturer: 3, trading_company: 4, medical_company: 5, finance: 6, construction_plant_real_estate: 7, consulting: 8, human_resources: 9, retail: 10, restaurant: 11, transportation_logistics: 12, energy: 13, travel: 14, security_cleaning: 15, beauty_esthetic: 16, education: 17, agriculture: 18, public_corporations: 19, ceremonial_occasion: 20, other: 21 }
  enum length_worked:{ half_year: 0, one_years: 1, three_years: 2, five_years: 3, seven_years: 4, ten_years: 5 }
end