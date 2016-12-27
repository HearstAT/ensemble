class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.references :business_unit, foreign_key: true
      t.string :name
      t.boolean :is_user

      t.timestamps
    end
  end
end
