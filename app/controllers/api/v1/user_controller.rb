module Api
  module V1
    class UserController < ApiApplicationController

      include RestApiConcerns


      def location_push

      end

      private

      def permited_params
        params.permit(:letters, :name, :country_id, :uf, :format)
      end
    end
  end
end
