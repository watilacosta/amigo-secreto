class Member < ApplicationRecord
  belongs_to :campaign
  validates  :name, :campaign, presence: true
  after_destroy :set_campaign_pending

  def set_pixel
    self.open  = false
    # Gera um token enquanto ele seja único ou seja não exista
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token if not Member.exists?(token: random_token)
    end
    self.save!
  end

  protected

  # Sempre que um membro é adicionando a uma campaign, a mesma é atualizada para status pending
  def set_campaign_pending
    self.campaign.update(status: :pending)
  end
end
