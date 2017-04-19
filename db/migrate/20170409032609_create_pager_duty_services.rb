# frozen_string_literal: true
class CreatePagerDutyServices < ActiveRecord::Migration[5.0]
  def change
    create_table :pager_duty_services do |t|
      t.references :pager_duty_config, foreign_key: true
      t.string :pager_duty_service_id
      t.string :name
      t.boolean :display, default: true

      t.timestamps
    end
  end
end
