class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, index: { unique: true }
      t.string :password_digest
      t.string :first_name, limit: 30
      t.string :last_name, limit: 30
      t.string :role, limit: 12, null: true
      t.integer :gender
      t.date :dob

      t.timestamps
    end
  end
end
