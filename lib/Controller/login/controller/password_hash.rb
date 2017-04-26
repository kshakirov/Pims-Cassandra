module TurboCassandra
  module Controller
    module PasswordHash
      def _hash_password data
        md5 = Digest::MD5.new
        md5.update data
      end

      def validate_hashes password, hash
        hash_with_salt = hash.split(':');
        case hash_with_salt.size
          when 1
            _hash_password(password) === hash
          when 2
            _hash_password(hash_with_salt[1] + password) === hash_with_salt[0]
          else
            false
        end
      end
    end
  end
end