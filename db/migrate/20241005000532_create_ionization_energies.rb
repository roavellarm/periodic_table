class CreateIonizationEnergies < ActiveRecord::Migration[6.1]
  def change
    create_table :ionization_energies do |t|
      t.references :element, null: false, foreign_key: true
      t.float :value

      t.timestamps
    end
  end
end
