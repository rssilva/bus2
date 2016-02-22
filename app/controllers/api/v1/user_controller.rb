module Api
  module V1
    class UserController < ApiApplicationController

      before_action :authenticate

      require 'geocoder'

      include RestApiConcerns

      def location_push
        queryES = {}

        # city = City.where('id = ?', permited_params[:city_id]).first
        city = City.where('name = ?', 'Porto Alegre').first
        ln  = Line.find_or_create_by({:name => permited_params[:line_name], :city_id => city.id})


        queryES[:filter] = {
            :geo_distance => {
                :distance => "10m",
                "users_reporting.location" => [permited_params[:lat].to_f, permited_params[:lon].to_f]
            }
        }
        result = ln.search_by queryES
        result.response

        ln.add_user(permited_params[:lat].to_f,permited_params[:lon].to_f, current_user.id)
        ln.__elasticsearch__.index_document

        lnRoute = LineRouteLog.new({:line_id => ln.id, :user_id => current_user.id})
        lnRoute.update_location(permited_params[:lat].to_f,permited_params[:lon].to_f)
        lnRoute.__elasticsearch__.index_document

        render json: lnRoute, status: :ok
      end

      def location_retrieve
        results = Geocoder.search([permited_params[:lat].to_f,permited_params[:lon].to_f])
        render json: results, status: :ok
      end

      private

      def permited_params
        params.permit(:lat, :lon, :line_name)
      end
    end
  end
end
