# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
begin
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
rescue

end

if File.exists? "tmp/paises.csv"
  data = File.read("tmp/paises.csv")
  data.split("\n").each{ |paisName|
    puts " - Country: "+paisName
    Country.find_or_create_by({:name => paisName})

  }
end

stateNamesMap = Hash.new
if File.exists? "tmp/estados.csv"
  data = File.read("tmp/estados.csv")
  data.split("\n").each{ |stateLine|
    (uf,name) = stateLine.split('|')
    stateNamesMap[uf] = name
  }
end

country = Country.find_or_create_by({:name => 'Brasil'})
Dir["tmp/csv_cidades_ibge/*.csv"].each{ |file_name|
  if File.exists? file_name
    data = File.read(file_name)
    stateUF = file_name.split('/')[-1].split('.')[0].upcase
    puts "- State: "+stateUF
    state = State.find_or_create_by({
                                          :name => stateNamesMap[stateUF],
                                          :uf => stateUF,
                                          :country_id => country.id
                                      })
    data.split("\n").each{ |cityName|
      puts "     - city: "+cityName
      city = City.find_or_create_by({
                                            :name => cityName.tr("\n","").tr("\r",""),
                                            :state_id => state.id
                                        })
    }
  end
}
