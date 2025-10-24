class CreateTags < ActiveRecord::Migration[8.0]
  def change
    create_table :tags do |t|
      t.string :mac_address
      t.references :student, null: true, foreign_key: true

      t.timestamps
    end
  end
end
