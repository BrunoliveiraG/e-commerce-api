module Admin
  class AllocateLicenseJob < ApplicationJob
    queue_as :default

    def perform(line_item)
      AllocateLicensesService.new(line_item).call
    end
  end
end