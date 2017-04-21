module TurboCassandra
  module API
    class Invoice
      private

      def get_interchanges interchanges
        unless interchanges.nil?
          interchanges.map do |i|
            p = @product_api.find_by_sku i
            unless p.nil?
              response = {}
              response[i] = p['part_number']
              response
            end
          end
        end
      end

      def add_interchanges invoice_products
        invoice_products.map do |ip|
          interchanges = get_interchanges(ip[:interchanges])
          if interchanges
            ip[:interchanges] = interchanges.compact
          else
            ip.delete :interchanges
          end
          ip
        end
      end

      def create_invoice_id invoice_data
        invoice_data['no'] + invoice_data['headerSeqNo'] + invoice_data['customerNo']
      end

      def prep_product_invoice invoice_data
        invoice_data['details'].map do |p|
          {
            sku: p['partId'],
            invoice_id: create_invoice_id(invoice_data)
          }
        end
      end

      def prep_invoice_product invoice_data
        invoice_data['details'].map do |p|
          {
              invoice_id: create_invoice_id(invoice_data),
              sku: p['partId'],
              interchanges: p['interchanges'],
              description: p['description'],
              part_type: p['partTypeName'],
              name: p['partNumber']
          }
        end
      end
      def save_invoice_product data
        ip = Model::InvoiceProduct.new data
        ip.save
      end

      def save_product_invoice data
        pi = Model::ProductInvoice.new data
        pi.save
      end

      def prep_invoices invoices

      end

      public

      def initialize
        @product_api =  Product.new
      end

      def save_invoice invoice_data
        product_invoices =   prep_product_invoice invoice_data
        invoice_products = prep_invoice_product invoice_data
        invoice_products = add_interchanges invoice_products
        product_invoices.map{|pi| save_product_invoice pi}
        invoice_products.map{|ip| save_invoice_product ip}

      end
      def get_product_by_invoice invoice_id
        Model::InvoiceProduct.find_by invoice_id: invoice_id
      end

      def get_invoice_by_product sku
        Model::ProductInvoice.find_by sku: sku
      end

      def get_also_bought_products sku
        invoice_ids = get_invoice_by_product sku
      end
    end
  end
end