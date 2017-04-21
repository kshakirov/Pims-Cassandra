require_relative '../../sync_helper'


def output_human_time starting_date
  time =starting_date.to_i
  Time.at(time/1000).to_datetime.to_s
end

def get_starting_date arg
  Time.now.to_time.to_i * 1000
  unless arg.nil?
    arg
  end
end

metadata_server = get_metdata_host
invoice_api = TurboCassandra::API::Invoice.new
updater = TurboCassandra::Sync::Invoice::Rest.new(metadata_server)

starting_date = get_starting_date(ARGV[0])

until  starting_date.nil?
  puts "Starting Date [#{output_human_time(starting_date)}]"
  invoice_data = updater.query_update_by_time starting_date
  counter = 1
  invoice_data['invoices'].compact.map do |invoice|
    puts " [#{counter}] Invoice  Size [#{invoice['details'].size}]"
    puts "Date #{invoice['updated']}"
    invoice_api.save_invoice invoice
    counter += 1
  end
  starting_date = invoice_data['nextDate']
end
