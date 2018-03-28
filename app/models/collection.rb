class Collection < ApplicationRecord
  validates_presence_of :title
  has_many :portfolios, dependent: :destroy
end
