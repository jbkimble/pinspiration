class Changecolumndefault < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :avatar, :string, default: "https://s.pinimg.com/images/user/default_444.png"
  end
end
