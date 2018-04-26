class Portfolio < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

   validates_presence_of :title, :collection_id

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  belongs_to :collection
  def self.by_position
   order("position ASC")
  end

end
