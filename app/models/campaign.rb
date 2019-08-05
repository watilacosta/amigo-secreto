class Campaign < ApplicationRecord
  belongs_to :user
  has_many :members, dependent: :destroy

  before_create :set_member
  before_create :set_status

  enum status: [:pending, :finished]
  validates :title, :description, :user, :status, presence: true

  def set_status
    self.status = :pending
  end

  # Quem está criando a campaign também é membro desta
  def set_member
    self.members << Member.create(name: self.user.name, email: self.user.email)
  end
end
