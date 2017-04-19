# frozen_string_literal: true
class CreatePagerDutyReports < ActiveRecord::Migration[5.0]
  def change
    create_table :pager_duty_reports do |t|
      t.references :business_unit, foreign_key: true
      t.integer :number_of_incidents

      t.timestamps
    end
  end
end
