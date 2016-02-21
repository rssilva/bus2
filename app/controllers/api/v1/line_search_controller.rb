module Api
  module V1
    class LineSearchController < ApiApplicationController


      include RestApiConcerns

      #GET /api/v1/line_search/search/:country/:state/:city?:name=&[radius=10km]
      def search_lines
        queryES = {}
        if !permited_params[:city].nil? or permited_params[:state].nil? or permited_params[:country].nil?
          queryES[:query] = {
              :bool => {
                  :must => []
              }
          }
          if !permited_params[:city].nil? and permited_params[:city] != "null"
            queryES[:query][:bool][:must] << {:match => { "city.name" => {:query => permited_params[:city].capitalize, :operator => 'and'}}}
          end
          if !permited_params[:state].nil? and permited_params[:state] != "null"
            queryES[:query][:bool][:must] << {:match => { "state.uf" => {:query => permited_params[:state].capitalize, :operator => 'and'}}}
          end
          if !permited_params[:country].nil? and permited_params[:country] != "null"
            queryES[:query][:bool][:must] << {:match => { "country.name" => {:query => permited_params[:country].capitalize, :operator => 'and'}}}
          end
        end
        if !permited_params[:lat].nil? and !permited_params[:lon].nil?
          queryES[:filter] = {
              :geo_distance => {
                  :distance => "12km",
                  "users_reporting.location" => [permited_params[:lat].to_f, permited_params[:lon].to_f]
              }
          }
        end
        result = Line.search_for(queryES)
        render json: result.response, status: :ok
      end


      private

      def permited_params
        params.permit(:lat, :lon, :city, :state, :country)
      end

    end
  end
end
