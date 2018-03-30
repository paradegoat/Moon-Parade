class Collection < ApplicationRecord
  validates_presence_of :title
  has_many :portfolios, dependent: :destroy

    mount_uploader :main_image, PortfolioUploader
end
