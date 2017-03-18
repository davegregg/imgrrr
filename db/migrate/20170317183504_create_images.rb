class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :title
      t.string :caption
      t.integer :views, default: 0

      t.timestamps
    end
  end
end
