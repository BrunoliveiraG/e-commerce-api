# frozen_string_literal: true

json.licenses do
  json.array! @licenses, :id, :key, :game_id, :user_id, :platform, :status
end
