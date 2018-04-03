# frozen_string_literal: true

module Api
  module V1
    class DevelopersController < Api::BaseController
      before_action :set_developer, only: %i[show]

      def index
        developers = Developer.includes(
          :developer_programming_languages,
          :programming_languages,
          :developer_languages,
          :languages
        )
        render json: developers, include: []
      end

      def show
        render json: @developer
      end

      private

      def set_developer
        @developer = Developer.find(params[:id])
      end
    end
  end
end
