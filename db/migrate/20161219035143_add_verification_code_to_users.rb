class AddVerificationCodeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :verification_code, :string
  end
end
