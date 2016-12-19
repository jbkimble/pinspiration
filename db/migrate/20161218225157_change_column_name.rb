class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :boards, :private, :isprivate
  end
end
