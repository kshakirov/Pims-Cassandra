def prepare_product_create product
  {
      manufacturer:   product['manufacturer'],
      part_type: product['part_type'],
      created_at: product['created_at'],
      part_number: product['part_number'],
      sku: product['sku']
  }
end