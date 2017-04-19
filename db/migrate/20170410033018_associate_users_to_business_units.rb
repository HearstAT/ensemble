# frozen_string_literal: true
class AssociateUsersToBusinessUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :user_business_units do |t|
      t.belongs_to :user, index: true
      t.belongs_to :business_unit, index: true
      t.timestamps
    end
  end
end
