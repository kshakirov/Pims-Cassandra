module TurboCassandra
  module API
    class User
      def all
        TurboCassandra::Model::User.all
      end
      def add_user user_hash
        user = TurboCassandra::Model::User.new user_hash
        user.save
      end
      def delete_user login
        TurboCassandra::Model::User.delete login
      end

      def find_user login
        TurboCassandra::Model::User.find login
      end

    end
  end
end