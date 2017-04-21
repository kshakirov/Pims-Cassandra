module TurboCassandra
  module API
    class Ranker
      private
      def get_bought_products
        TurboCassandra::Model::ProductInvoice.distinct 'sku'
      end

      def sort_freq_map frequency_map
        map = frequency_map.sort_by { |fm| fm[:freq] }
        if map.size >= 10
          return map.reverse[0..9]
        end
        map.reverse
      end

      def prep_ranked_prods freq_map, sku
        freq_map.map do |m|
          p = m[:product]
          {
              sku_original: sku,
              rank: m[:freq],
              sku: p['sku'],
              description: p['description'],
              part_type: p['part_type'],
              name: p['name'],
              interchanges: p['interchanges']
          }
        end
      end

      def get_sku_freq unique_skus, invoices
        unique_skus.map do |us|
          freq = invoices.count { |i| i['sku'] == us['sku']}
          {
              product: us,
              freq: freq
          }
        end
      end

      def _rank invoice_prods, sku
        unique_skus = invoice_prods.uniq { |invoice| invoice['sku'] }
        unique_skus.delete_if {|s| s['sku'] == sku}
        freq_map = get_sku_freq(unique_skus, invoice_prods)
        freq_map = sort_freq_map(freq_map)
        prep_ranked_prods(freq_map, sku)
      end
      def get_invoices_ids invoices
        invoices.map{|i| i['invoice_id']}
      end
      public
      def rank_bougt_products sku
        invoices = TurboCassandra::Model::ProductInvoice.find_by sku: sku
        invoices_ids = get_invoices_ids(invoices)
        invoice_prods = TurboCassandra::Model::InvoiceProduct.find_in_by invoice_id: invoices_ids
        _rank(invoice_prods, sku)
      end
    end
  end
end