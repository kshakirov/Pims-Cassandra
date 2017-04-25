module TurboCassandra
  module Controller
    class AuthenticationNode
      def initialize
        @authentication_node = TurboCassandra::API::AuthenticationNode.new
      end
      def all
        @authentication_node.all
      end
      def get_node params
        name = params['name']
        node = @authentication_node.get_node name
        node.to_hash
      end
      def add_node body
        node_hash = JSON.parse body
        @authentication_node.add_node node_hash
      end
      def delete_node params
        name = params['name']
        @authentication_node.delete_node name
      end
    end
  end
end