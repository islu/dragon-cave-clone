class CreateDragons < ActiveRecord::Migration[5.1]
  def change
    create_table :dragons do |t|
      t.references :account
      t.references :location

      t.string :name
      t.string :description
      t.integer :gender

      t.timestamps
    end
  end
end
