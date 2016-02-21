module Api
  module V1
    class CountryController < ApiApplicationController

      def find_match
        @countries = Country.where('name like ?', permited_params[:letters]+'%')
        render 'api/v1/country/find'
      end


      def create
        begin
          @entity = Country.create!({:name => permited_params[:name]})
          render 'api/v1/state/create'
        rescue Exception => e
          @err = e
          render 'api/v1/error'
        end
      end


      private

      def permited_params
        params.permit(:letters, :name, :format)
      end

    end
  end
end


