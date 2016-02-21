require 'rails_helper'

RSpec.describe LineRouteLog, type: :model do

  fixtures :all

  before(:each, elasticsearch: true) do

    Country.delete_all
    State.delete_all
    City.delete_all
    Line.delete_all

    country = Country.find_or_create_by({:name => 'CountryTest'})
    @state = State.find_or_create_by({:name => 'StateTest', :country => country, :uf => 'ST'})
    @city = City.find_or_create_by({:name => 'CityTest', :state => @state})
    @user = User.create!({:name => 'John',:email => 'john@doe.com', :password => 'test', :password_confirmation => 'test'})

    [Line, LineRouteLog].each do |model|
      model.__elasticsearch__.create_index!(force: false)
    end
  end

  after(:each, elasticsearch: true) do
    [Line, LineRouteLog].each do |model|
      model.__elasticsearch__.client.indices.delete index: model.index_name
    end
  end

  it 'should log route', :elasticsearch do

    search_before = LineRouteLog.search_for query: { :match_all => {} }
    searchCount_before = search_before.response['hits']['total'].to_i

    ln = Line.find_or_create_by({:name => 'T9', :city_id => @city.id})
    ln.add_user(-30.0527,-51.1637681, 1)
    ln.add_user(-30.0523,-51.1637681, 1)
    ln.add_user(-30.0524,-51.1637681, 1)
    ln.add_user(-30.0525,-51.1637681, 1)
    ln.add_user(-30.0522,-51.1637681, 1)
    ln.add_user(-30.0521,-51.1637681, 1)
    ln.add_user(-30.0528,-51.1637681, 1)
    ln.__elasticsearch__.index_document
    Line.__elasticsearch__.refresh_index!

    (0..30).each{|r|
      lnRoute = LineRouteLog.new({:line_id => ln.id, :user_id => @user.id})
      lnRoute.update_location(-30.019451+r.to_f,-51.1367981+r.to_f)
      lnRoute.__elasticsearch__.index_document
    }
    LineRouteLog.__elasticsearch__.refresh_index!

    search_after = LineRouteLog.search_for query: { :match_all => {} }
    expect(search_after.response['hits']['total']).to eq(searchCount_before + 31)
    # search_after.response['hits']['total'].should eq(searchCount_before + 31)






  end







end
