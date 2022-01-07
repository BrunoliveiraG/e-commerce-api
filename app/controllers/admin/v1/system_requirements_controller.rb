# frozen_string_literal: true

module Admin
  module V1
    class SystemRequirementsController < ApiController
      before_action :load_system_requirements, only: %i[update destroy]

      def index
        @system_requirements = SystemRequirement.all
      end

      def create
        @system_requirement = SystemRequirement.new
        @system_requirement.attributes = system_requirement_params
        save_system_requirement!
      end

      def update
        @system_requirement.attributes = system_requirement_params
        save_system_requirement!
      end

      def destroy
        @system_requirement.destroy
      rescue StandardError
        render_error(fields: @system_requirement.errors.messages)
      end

      private

      def load_system_requirements
        @system_requirement = SystemRequirement.find(params[:id])
      end

      def system_requirement_params
        return {} unless params.key?(:system_requirement)

        params.require(:system_requirement).permit(:id, :name, :operating_system, :storage,
                                                   :processor, :memory, :graphics_card)
      end

      def save_system_requirement!
        @system_requirement.save!
        render :show
      rescue StandardError
        render_error(fields: @system_requirement.errors.messages)
      end
    end
  end
end