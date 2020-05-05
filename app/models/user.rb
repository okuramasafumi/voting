class User < ApplicationRecord
  validates :name, :email, presence: true, uniqueness: true

  has_many :events,
    foreign_key: :owner_id,
    inverse_of: :owner,
    dependent: :destroy
end
