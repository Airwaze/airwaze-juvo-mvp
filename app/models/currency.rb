class Currency < ApplicationRecord
  validates :kind, presence: true

  enum kind: {
    juvo_token: 0,
    days_of_air_time: 1
  }

  def name
    kind.humanize
  end

  def name_plural
    juvo_token? ? name.pluralize : name
  end
end
