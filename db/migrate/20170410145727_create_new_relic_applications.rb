# frozen_string_literal: true
class CreateNewRelicApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :new_relic_applications do |t|
      t.references :new_relic_config, foreign_key: true
      t.integer :new_relic_application_id
      t.string :name
      t.string :language
      t.string :health_status
      t.boolean :reporting
      t.datetime :last_reported_at
      t.decimal :response_time
      t.decimal :throughput
      t.decimal :error_rate
      t.decimal :apdex_target
      t.decimal :apdex_score
      t.integer :host_count
      t.integer :instance_count

      t.timestamps
    end
  end
end
