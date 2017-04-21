module TurboCassandra
  module Model
    class InvoiceProduct < BaseModel
    end
    InvoiceProduct.primary_index =  ['invoice_id', 'sku']

    class ProductInvoice < BaseModel
    end
    ProductInvoice.primary_index  = ['sku', 'invoice_id']
  end
end