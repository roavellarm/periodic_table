class CreateAnnotations < ActiveRecord::Migration[6.1]
  def change
    create_table :annotations do |t|
      t.text :content
      t.references :element, null: false, foreign_key: true

      t.timestamps
    end
  end
end
