class CreateShells < ActiveRecord::Migration[6.1]
  def change
    create_table :shells do |t|
      t.references :element, null: false, foreign_key: true
      t.integer :number

      t.timestamps
    end
  end
end
