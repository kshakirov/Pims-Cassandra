module TurboCassandra
  module NotExternalManufacturer
    @@not_external_manufacturer =  ['I.H.I.']

    def is_not_external_manufacturer? product
      index = @@not_external_manufacturer.find_index(product['manufacturer'])
      not index.nil?
    end

    def add_hidden_part product, skeleton
      skeleton[:not_external_part_number] = product['part_number']
    end
  end
end