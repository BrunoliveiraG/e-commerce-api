# frozen_string_literal: true

json.system_requirement do
  json.call(@system_requirement, :id, :name, :operating_system, :storage, :processor, :memory, :graphics_card)
end
