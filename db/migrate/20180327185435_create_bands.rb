class CreateBands < ActiveRecord::Migration[5.1]
  def change
    create_table :bands do |t|
      t.string :name
      t.text :description
      t.string :pictureLeft
      t.string :pictureRight

      t.timestamps
    end
  end
end
