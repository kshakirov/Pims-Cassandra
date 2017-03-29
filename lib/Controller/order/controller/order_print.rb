module TurboCassandra
  module Controller
    module OrderPrint
      private

      def print_price price, order_currency
        "#{price} #{order_currency}"
      end

      def products_2_cells products, currency
        products.map do |p|
          [
              p['part_type'], p['name'], p['oem_part'],
              print_price(p['price'], currency),
              p['quantity'],
              print_price(p['row_total'], currency)
          ]
        end
      end

      def table_headers
        ['Part Type', 'Name', 'OEM Part', 'Price', 'Qty', 'Subtotal']
      end


      def get_addresses address
        address.values
      end

      def get_totals_table order
        [
            ['Subtotal', "#{order['subtotal'].to_s} #{order['currency_code']}"],
            ['Shipping', order['shipping_handling']],
            ['Grand Total', "#{order['grand_total'].to_s} #{order['currency_code']}"]
        ]
      end

      public


      def print_order order_loaded
        products = products_2_cells(order_loaded['products'], order_loaded['currency_code'])
        products.unshift(table_headers)
        ba = get_addresses(order_loaded['billing_address'])
        s_as = get_addresses(order_loaded['shipping_address'])
        order_total_data = get_totals_table(order_loaded)

        pdf = Prawn::Document.new
        pdf.image "ti-logo_100x77.jpg", :width => 50, :height => 30
        pdf.move_down 5
        pdf.font "Times-Roman", :style => :bold
        pdf.text "Order  ID: <font size='8'> <color rgb='#FF82AB'> #{order_loaded['order_id']} </color> </font>", :inline_format => true
        pdf.move_down 20
        pdf.font "Times-Roman", :style => :bold
        pdf.text "Order Date: <font size='8' styles='italic'>#{order_loaded['updated_at']} </font>", :inline_format => true
        pdf.move_down 20


        b_cursor = pdf.cursor
        pdf.bounding_box([0, pdf.cursor], :width => 200) do
          pdf.font_size 10
          pdf.font "Times-Roman", :style => :bold
          pdf.text "Billing Address"
          pdf.move_down 10
          pdf.font_size 6
          pdf.font "Times-Roman", :style => :italic
          s_as.each do |b|
            pdf.text b
            pdf.move_down 1
          end
        end

        a_cursor = pdf.cursor
        pdf.bounding_box([300, pdf.cursor + (b_cursor - a_cursor)], :width => 200) do
          pdf.font "Times-Roman", :style => :bold
          pdf.font_size 10
          pdf.text "Shipping Address"
          pdf.move_down 10
          pdf.font_size 6
          pdf.font "Times-Roman", :style => :italic
          ba.each do |b|
            pdf.text b
            pdf.move_down 1
          end
        end

        pdf.move_down 20
        pdf.font_size 10
        pdf.font "Times-Roman", :style => :normal
        order_table = pdf.make_table(order_total_data, :column_widths => [160, 80])
        pdf.table(products, :column_widths => [100, 150, 40, 80, 40, 80], :cell_style => {:font => "Times-Roman", :font_style => :italic})
        pdf.table([["", order_table]], :column_widths => [250, 240])

        pdf.render

      end
    end
  end
end