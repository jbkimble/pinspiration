class CreateSharedBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :shared_boards do |t|
      t.integer :owner_id
      t.integer :viewer_id
      t.integer :board_id

      t.timestamps
    end
    add_index :shared_boards, :owner_id
    add_index :shared_boards, :viewer_id
    add_index :shared_boards, :board_id
  end
end
