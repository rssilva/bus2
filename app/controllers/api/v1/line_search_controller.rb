module Api
  module V1
    class LineSearchController < ApiApplicationController

      include RestApiConcerns


      #GET /api/v1/line_search/search/:country/:state/:city?:name=&[radius=10km]
      def search_lines

        queryES = {
          # query: { prefix:  { title: query[:title] } },
          # query: { :match_all => {} },
          # filter: {
          #   geo_distance: {
          #       distance: "12km",#params[:radius],
          #       users_reporting: [ params[:lat], params[:lon] ]
          #   }
          # }

            # :bool => {
            #     :must => {
            #         :match_all => {}
            #     },
            #
            # }
          :filter => {
              :geo_distance => {
                  :distance => "12km",
                  "users_reporting.location" => [permited_params[:lat].to_f, permited_params[:lon].to_f]
              }
          }

        }
        result = Line.search_for(queryES)
        render json: result.response, status: :ok
      end


      private

      def permited_params
        params.permit(:lat, :lon)
      end

    end
  end
end
