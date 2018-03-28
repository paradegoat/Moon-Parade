class AddCollectionRefrenceToPortfolios < ActiveRecord::Migration[5.1]
  def change
    add_reference :portfolios, :collection, foreign_key: true
  end
end
