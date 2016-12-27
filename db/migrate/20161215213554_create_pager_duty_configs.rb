class CreatePagerDutyConfigs < ActiveRecord::Migration[5.0]
  def change
    create_table :pager_duty_configs do |t|
      t.references :business_unit, foreign_key: true
      t.string :sub_domain
      t.string :api_key
      t.string :service_api_key

      t.timestamps
    end
  end
end
