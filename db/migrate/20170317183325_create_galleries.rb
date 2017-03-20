class CreateGalleries < ActiveRecord::Migration[5.0]
  def change
    create_table :galleries do |t|
      t.string :title
      t.text :description
      t.integer :views, default: 0
      t.integer :images_count, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
