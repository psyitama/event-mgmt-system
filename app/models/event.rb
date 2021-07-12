class Event < ApplicationRecord
  # Relationships
  belongs_to :state
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :joins, dependent: :destroy
  # Validations
  validates :name, :date, :location, :state_id, presence: true
  validates :name, length: {minimum: 2}
  validate :expiration_date_cannot_be_in_the_past

  private
  def expiration_date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end
end
