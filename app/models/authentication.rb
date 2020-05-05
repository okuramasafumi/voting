class Authentication < ApplicationRecord
  belongs_to :user

  validates :provider, :uid, presence: true
  validates :provider, uniqueness: {scope: :user_id}

  def self.find_or_create_from_auth_hash(auth)
    record = find_or_initialize_by(provider: auth[:provider], uid: auth[:uid])
    return record if record.persisted?

    info = auth[:info]
    record.user_info = info
    record.credentials = auth[:credentials]
    record.extra = auth[:extra]

    user = User.create(name: info[:name], email: info[:email])
    record.user = user

    record.save
    record
  end
end
