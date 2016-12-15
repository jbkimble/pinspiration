class CreatePinComments < ActiveRecord::Migration[5.0]
  def change
    create_table :pin_comments do |t|
      t.references :comment, foreign_key: true
      t.references :pin, foreign_key: true

      t.timestamps
    end
  end
end
