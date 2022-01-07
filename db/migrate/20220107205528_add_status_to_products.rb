# frozen_string_literal: true

class AddStatusToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :status, :integer
  end
end
