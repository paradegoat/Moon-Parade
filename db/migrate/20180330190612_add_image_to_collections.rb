class AddImageToCollections < ActiveRecord::Migration[5.1]
  def change
    add_column :collections, :main_image, :text
  end
end
