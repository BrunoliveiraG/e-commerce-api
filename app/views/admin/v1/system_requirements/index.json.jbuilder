json.system_requirements do
  json.array! @loading_service.records,
              :id, :name, :operating_system, :storage, :processor, :memory, :graphics_card
end

json.meta do
  json.partial! 'shared/pagination', pagination: @loading_service.pagination
end