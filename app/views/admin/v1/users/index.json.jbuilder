# frozen_string_literal: true

json.users do
  json.array! @loading_service.records, :id, :name, :email, :profile
end
