module TurboCassandra
  module API
    class CustomerGroup
      def all
        TurboCassandra::Model::CustomerGroup.all
      end
      def add_group hash
        group = TurboCassandra::Model::CustomerGroup.new hash
        group.save

      end
    end
  end
end