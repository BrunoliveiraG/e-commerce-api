# frozen_string_literal: true

class CreateWishItems < ActiveRecord::Migration[6.0]
  def change
    create_table :wish_items do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
