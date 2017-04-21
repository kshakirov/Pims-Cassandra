require_relative '../../sync_helper'

def calculate_time recent_time

end
metadata_server = get_metdata_host
invoice_api = TurboCassandra::API::Invoice.new
updater = TurboCassandra::Sync::Invoice::Rest.new(metadata_server)
#invoices = updater.query_initial 1446249600
#invoices = updater.query_update_by_time 1492599159000
invoices = updater.query_update_by_time 1446249600000
counter = 1
invoices.compact.map do |invoice|
  puts " [#{counter}] Invoice  Size [#{invoice['details'].size}]"
  puts "Date #{invoice['updated']}"
  invoice_api.save_invoice invoice
  counter += 1
end
