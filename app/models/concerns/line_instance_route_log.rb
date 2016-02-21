module LineInstanceRouteLog
  extend ActiveSupport::Concern

  included do

    include Elasticsearch::Model

    index_name "lines-route-log-#{Rails.env}"

    settings analysis: { analyzer: { whole_word: { tokenizer: 'keyword' } } } do
      mappings _ttl: { enabled: true, default: '1d' }
      mappings do
        indexes :updated_when, type: :date
        indexes :user_id, type: :integer
        indexes :line_id, type: :integer
        indexes :location, type: :geo_point, lat_lon: true
      end
    end

    def to_indexed_json
      as_json(
          :only => [ :user_id, :line_id ],
          :methods => [ :updated_when, :location ]
      )
    end

    def as_indexed_json(options = {})
      as_json(
          :only => [ :user_id, :line_id ],
          :methods => [ :updated_when, :location ]
      )
    end

    def updated_when
      DateTime.now
    end


    def location
      @location
    end


    def update_location lat, lon
      @location = [lat, lon]
    end


    def self.search_for(*args,&block)
      __elasticsearch__.search(*args, &block)
    end


  end

end
