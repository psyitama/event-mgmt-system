class User < ApplicationRecord
  # Relationships
  belongs_to :state
  has_many :events
  has_many :comments
  has_many :joins, dependent: :destroy
  has_many :joined_events, through: :joins, source: :event
  has_secure_password
  # Validations
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :email, :location, presence: true
  validates :first_name, :last_name, length: {minimum: 2}
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  has_secure_password
  # Callback/s
  before_save :downcase_email
  private
  def downcase_email
    self.email.downcase!
  end
end
