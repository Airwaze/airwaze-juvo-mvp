class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :wallets, autosave: true, dependent: :destroy

  validates :name, :image_url, :kind, :qr_code, presence: true

  enum kind: {
    regular: 0,
    merchant: 1,
    bank: 2
  }

  def main_sender_wallet
    case kind.to_sym
    when :regular, :merchant
      wallets.joins(:currency).where(currencies: {kind: :juvo_token}).first
    when :bank
      wallets.joins(:currency).where(currencies: {kind: :days_of_air_time}).first
    end
  end

  def qr_code
    recent_qr_code = Digest::SHA1.hexdigest(self.email)

    if self[:qr_code] != recent_qr_code
      update(qr_code: recent_qr_code)
    end

    recent_qr_code
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      info = auth.info
      user.email = info.email
      user.name = info.name
      user.image_url = info.image
      user.password = Devise.friendly_token[0,20]
      user.wallets << Wallet.new(currency: Currency.juvo_token.first, balance: 100)
      user.wallets << Wallet.new(currency: Currency.days_of_air_time.first, balance: 0)
    end
  end
end
