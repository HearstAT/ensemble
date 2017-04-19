# frozen_string_literal: true
class CreateDomains < ActiveRecord::Migration[5.0]
  def change
    create_table :domains do |t|
      t.string :domain
      t.timestamps
    end
  end
end
