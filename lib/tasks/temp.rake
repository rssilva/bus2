require 'rake'

namespace :temp do

  desc 'test es'
  task :test_es => :environment do

    Line.__elasticsearch__.create_index! force: true
    city = City.first
    ln = Line.find_or_create_by({:name => 'T9', :city_id => city.id})

    ln.add_user(-30.0527,-51.1637681, 1)
    ln.add_user(-30.0527,-51.1637681, 1)
    ln.add_user(-30.0527,-51.1637681, 1)
    ln.add_user(-30.0527,-51.1637681, 1)
    ln.add_user(-30.0527,-51.1637681, 1)
    ln.add_user(-30.0527,-51.1637681, 1)
    ln.add_user(-30.0527,-51.1637681, 1)

    ln.__elasticsearch__.index_document



  end

end