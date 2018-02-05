class Portfolio < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

   validates_presence_of :title, :body

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  def self.by_position
   order("position ASC")
  end

end
