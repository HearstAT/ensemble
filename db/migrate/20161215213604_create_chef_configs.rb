# frozen_string_literal: true
class CreateChefConfigs < ActiveRecord::Migration[5.0]
  def change
    create_table :chef_configs do |t|
      t.references :business_unit, foreign_key: true
      t.string :chef_server_url
      t.string :chef_organization
      t.string :admins

      t.timestamps
    end
  end
end
