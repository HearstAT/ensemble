require_relative '20161215213533_create_users'

class RevertCreateUsers < ActiveRecord::Migration[5.0]
  def change
    revert CreateUsers
  end
end
