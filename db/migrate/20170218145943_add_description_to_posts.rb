class AddDescriptionToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :facebook_description, :string
    add_column :posts, :meta_description, :string
  end
end
