class CreatePins < ActiveRecord::Migration[5.0]
  def change
    create_table :pins do |t|
      t.text :source
      t.text :name
      t.text :image

      t.timestamps
    end
  end
end
