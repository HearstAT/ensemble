class AddInitialToPagerDutyConfigs < ActiveRecord::Migration[5.0]
  def change
    add_column :pager_duty_configs, :initial, :boolean, default: true
  end
end
