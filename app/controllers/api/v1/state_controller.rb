module Api
  module V1
    class StateController < ApplicationController
      def find_match
        @states = State.where('country_id = ? and name like ?', permited_params[:country_id], permited_params[:letters]+'%')
        render 'api/v1/state/find'
      end


      def create
        begin
          @entity = State.create!({:name => permited_params[:name], :country_id => permited_params[:country_id], :uf => permited_params[:uf]})
          render 'api/v1/state/create'
        rescue Exception => e
          @err = e
          render 'api/v1/error'
        end
      end


      private

      def permited_params
        params.permit(:letters, :name, :country_id, :uf, :format)
      end
    end
  end
end
