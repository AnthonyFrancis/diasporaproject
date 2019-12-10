class List < ApplicationRecord
  belongs_to :user
  has_many :investors, class_name: 'Profile'

  validates :name, presence: true
end
