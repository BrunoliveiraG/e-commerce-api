# frozen_string_literal: true

json.system_requirements do
  json.array! @system_requirements, :id, :name, :operating_system, :storage, :processor, :memory, :graphics_card
end
