class Event < ApplicationRecord
  # Relationships
  belongs_to :state
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :joins, dependent: :destroy
  # Validations
  validates :name, :date, :location, :state_id, presence: true
  validates :name, length: {minimum: 2}
  
end
