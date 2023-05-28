class CreateTrackings < ActiveRecord::Migration[7.0]
  def change
    create_table :trackings do |t|
      t.references :link
      t.references :user, null: true
      t.string :user_agent
      t.string :ip, limit: 45

      t.timestamps
    end
  end
end
