# frozen_string_literal: true

class RenameVideoBoardToGraphicsCard < ActiveRecord::Migration[6.0]
  def change
    rename_column :system_requirements, :video_board, :graphics_card
  end
end
