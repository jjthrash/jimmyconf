require 'yaml'
require 'csv'
load 'report_status'

# client is a FreshBooks::Client created using my API key
project_id = 29
before = Date.new(2013,7,14)
after = Date.new(2013, 7,7)
time_entries = client.time_entry.list(:project_id => project_id, :date_from => after, :date_to => before)

CSV.open('out.csv', 'w') do |csv|
  time_entries['time_entries']['time_entry'].each do |t|
    csv << [t['time_entry_id'], t['date'], t['hours']]
  end
end

puts time_entries['time_entries']['time_entry'].map {|t| [t['time_entry_id'], t['date'], t['hours']]}.to_yaml
time_entries['time_entries']['time_entry'].map {|t| t['hours'].to_f}.reduce(&:+)
