module TurboCassandra
  module API
    class AuthenticationNode
      def all
        TurboCassandra::Model::AuthenticationNode.all
      end
      def add_node node_hash
        node = TurboCassandra::Model::AuthenticationNode.new node_hash
        node.save
      end
      def delete_node node_name
        TurboCassandra::Model::AuthenticationNode.delete node_name
      end

      def get_node name
        TurboCassandra::Model::AuthenticationNode.find name
      end

    end
  end
end