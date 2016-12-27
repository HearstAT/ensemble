class CreateNewRelicConfigs < ActiveRecord::Migration[5.0]
  def change
    create_table :new_relic_configs do |t|
      t.references :business_unit, foreign_key: true
      t.string :account_number
      t.string :api_key

      t.timestamps
    end
  end
end
