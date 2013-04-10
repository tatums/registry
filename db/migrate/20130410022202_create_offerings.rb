class CreateOfferings < ActiveRecord::Migration
  def change
    create_table :offerings do |t|
      t.string :title
      t.string :description
      t.integer :portions
      t.decimal :amount, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
