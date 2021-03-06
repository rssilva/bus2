module LineInstance
  extend ActiveSupport::Concern

  included do

    include Elasticsearch::Model

    index_name "lines-#{Rails.env}"

    settings analysis: { analyzer: { whole_word: { tokenizer: 'keyword' } } } do
      mappings _ttl: { enabled: true, default: '2m' }
      mappings do
        indexes :id, type: :integer
        indexes :name, type: :string, analyzer: 'whole_word'
        indexes :last_updated, type: :date

        #Nested Mapping for city
        indexes :city do
          indexes :id, type: :integer
          indexes :name, type: :string, analyzer: 'whole_word'
          indexes :state do
            indexes :id, type: :integer
            indexes :name, type: :string, analyzer: 'whole_word'
            indexes :country do
              indexes :id, type: :integer
              indexes :name, type: :string, analyzer: 'whole_word'
            end
          end
        end

        indexes :users_reporting do
          indexes :location, type: :geo_point, lat_lon: true
          indexes :user_id, type: :integer
        end

        # indexes :city, type: :string
        # indexes :state, type: :string

      end
    end

    def to_indexed_json
      as_json(
          :only => [ :id, :name ],
          :methods => [ :last_updated, :city,:state, :country, :users_reporting ]
      )
    end

    def as_indexed_json(options = {})
      as_json(
          :only => [ :id, :name ],
          :methods => [ :last_updated, :city, :state, :country, :users_reporting ]
      )
    end

    #Attrs

    def last_updated
      DateTime.now
    end


    def state
      self.city.state
    end

    def country
      self.city.state.country
    end

    def users_reporting
      if @users_reporting.nil?
        @users_reporting = Array.new
      end
      @users_reporting
    end


    def add_user lat, lon, user_id
      if @users_reporting.nil?
        @users_reporting = Array.new
      end
      @users_reporting << Struct.new(:location, :user_id).new([lat, lon], user_id)
    end

    def rem_user user_id
      if @users_reporting.nil?
        @users_reporting = Array.new
      end
      @users_reporting = @users_reporting.reject{ |r| r[:user_id] == user_id }
    end

    def set_last_updated dt
      @last_update = dt
    end


    def self.search_for(*args,&block)
      __elasticsearch__.search(*args, &block)
    end



  end

end
