class Dragon < ApplicationRecord
  validates :name, uniqueness: true

  belongs_to :account, optional: true
  belongs_to :location, optional: true

end
