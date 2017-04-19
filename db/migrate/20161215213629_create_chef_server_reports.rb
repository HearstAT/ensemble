# frozen_string_literal: true
class CreateChefServerReports < ActiveRecord::Migration[5.0]
  def change
    create_table :chef_server_reports do |t|
      t.references :business_unit, foreign_key: true
      t.integer :number_of_nodes
      t.integer :number_of_users
      t.integer :number_of_cookbooks

      t.timestamps
    end
  end
end
