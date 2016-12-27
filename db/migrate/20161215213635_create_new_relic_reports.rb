class CreateNewRelicReports < ActiveRecord::Migration[5.0]
  def change
    create_table :new_relic_reports do |t|
      t.references :business_unit, foreign_key: true
      t.integer :number_of_servers
      t.integer :number_of_apps

      t.timestamps
    end
  end
end
