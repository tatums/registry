class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.decimal :amount, :precision => 8, :scale => 2
      t.references :offering, index: true
      t.integer :user_id

      t.timestamps
    end
  end
end
