module TurboCassandra
  module Controller
    module MessageLogPagination
      private
      def get_paging_state params
        if params.key? 'paging_state' and params['paging_state']
          hex_to_bin(params['paging_state'])
        end
      end

      def bin_to_hex(s)
        unless s.nil?
          s.each_byte.map { |b| b.to_i }
        end
      end

      def hex_to_bin(s)
        s.map { |x| x.chr }.join
      end

      def get_page_size params
        if params.key? 'page_size' and params['page_size']
          params['page_size']
        else
          10
        end
      end

      public
      def paginated body
        params = JSON.parse body
        params['paging_state'] = get_paging_state params
        params['page_size'] = get_page_size params
        response = @message_log_api.paginate(params)
        response[:paging_state] = bin_to_hex(response[:paging_state])
        response
      end
    end
  end
end