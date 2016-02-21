module Api
  module V1
    class CityController < ApiApplicationController
      def find_match
        @cities = City.where('state_id = ? and name like ?', permited_params[:state_id], permited_params[:letters]+'%')
        render 'api/v1/city/find'
      end


      def create
        begin
          @entity = City.create!({:name => permited_params[:name], :state_id => permited_params[:state_id]})
          render 'api/v1/city/create'
        rescue Exception => e
          @err = e
          render 'api/v1/error'
        end
      end


      private

      def permited_params
        params.permit(:letters, :name, :state_id, :format)
      end
    end
  end
end
