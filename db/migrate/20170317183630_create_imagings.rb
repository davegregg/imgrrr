class CreateImagings < ActiveRecord::Migration[5.0]
  def change
    create_table :imagings do |t|
      t.references :gallery, foreign_key: true
      t.references :image, foreign_key: true

      t.timestamps
    end
  end
end
