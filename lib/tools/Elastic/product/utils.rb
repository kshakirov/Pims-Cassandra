module TurboCassandra
  def self.is_ti_manufactured? product
      unless product.nil?
      product['manufacturer']=='Turbo International'
      end
  end

  def self.normalize_part_number part_number
    part_number.downcase.gsub("/[^[:alnum:][:space:]]/u", '')
  end
end