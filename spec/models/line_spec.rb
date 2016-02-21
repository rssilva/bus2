require 'rails_helper'

RSpec.describe Line, type: :model do

  before(:each, elasticsearch: true) do

    Country.delete_all
    State.delete_all
    City.delete_all
    Line.delete_all

    country = Country.find_or_create_by({:name => 'CountryTest'})
    @state = State.find_or_create_by({:name => 'StateTest', :country => country, :uf => 'ST'})
    @city = City.find_or_create_by({:name => 'CityTest', :state => @state})

    [Line, LineRouteLog].each do |model|
      model.__elasticsearch__.create_index!(force: false)
    end
  end

  after(:each, elasticsearch: true) do
    [Line, LineRouteLog].each do |model|
      model.__elasticsearch__.client.indices.delete index: model.index_name
    end
  end

  it 'should search with es', :elasticsearch do

    search_before = Line.search_for query: { :match_all => {} }
    searchCount_before = search_before.response['hits']['total'].to_i

    ln = Line.find_or_create_by({:name => 'T9', :city_id => @city.id})
    ln.add_user(-30.0527,-51.1637681, 1)
    ln.add_user(-30.0527,-51.1637681, 1)
    ln.add_user(-30.0527,-51.1637681, 1)
    ln.add_user(-30.0527,-51.1637681, 1)
    ln.add_user(-30.0527,-51.1637681, 1)
    ln.add_user(-30.0527,-51.1637681, 1)
    ln.add_user(-30.0527,-51.1637681, 1)
    ln.__elasticsearch__.index_document
    Line.__elasticsearch__.refresh_index!

    search_after = Line.search_for query: { :match_all => {} }
    expect(search_after.response['hits']['total']).to eq(searchCount_before + 1)
  end


  it {
    should validate_presence_of :name
  }

  it {
    should validate_presence_of :city_id
  }

  it {
    should_not allow_value("").for(:name)
  }

  it { should have_one(:path)}

  it {
    should validate_uniqueness_of(:name)
  }

end
