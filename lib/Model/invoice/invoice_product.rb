module TurboCassandra
  module Model
    class InvoiceProduct < BaseModel
    end
    InvoiceProduct.primary_index =  ['invoice_id', 'sku']

    class ProductInvoice < BaseModel
    end
    ProductInvoice.primary_index  = ['sku', 'invoice_id']

    class AlsoBoughtProduct < BaseModel

    end
    AlsoBoughtProduct.primary_index  = ['sku_original', 'rank', 'sku']
  end
end