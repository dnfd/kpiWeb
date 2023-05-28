class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :full, limit: 256
      t.string :short, limit: 20
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
