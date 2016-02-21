module Api
  module V1
    class LineSearchController < ApiApplicationController

      include RestApiConcerns


      #GET /api/v1/line_search/:name?[radius=10km]


      def search_lines

        queryES = {
          # query: { prefix:  { title: query[:title] } },
          filter: {
            geo_distance: {
                distance: params[:radius],
                users_reporting: {
                    lon: params[:longitude],
                    lat: params[:latitude]
                }
            }
          }
        }
        result = Line.search(queryES)
      end

    end
  end
end
