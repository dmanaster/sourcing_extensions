class Extension < ApplicationRecord
  has_many :updates, :dependent => :destroy
  validates :name, :presence => true
  validates :url, :presence => true
  scope :alphabetical, -> { order(name: :ASC) }
  scope :last_updated, -> { includes(:updates).order('updates.date DESC') }
end
