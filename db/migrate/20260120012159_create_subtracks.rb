class CreateSubtracks < ActiveRecord::Migration[8.0]
  def change
    create_table :subtracks do |t|
      t.integer :amount
      t.string :memo
      t.date :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
