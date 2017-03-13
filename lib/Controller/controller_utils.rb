module TurboCassandra
  module Controller
    module Utils

      def compact_objects hashes
        if hashes.class.name == 'Hash'
          hashes.compact!
          Hash[hashes.map { |k, v| [k, compact_objects(v)] }.flatten]
        elsif hashes.class.name == "Array"
          hashes.map { |hash| compact_objects(hash) }
        end
        hashes
      end
    end
  end
end