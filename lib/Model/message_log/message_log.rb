module TurboCassandra
  module Model
    class MessageLog < BaseModel
      def save
        super
        if @attributes.key? 'id'
          @attributes['id'].to_s
        else
          @attributes[:id].to_s
        end
      end
    end
    MessageLog.primary_index =  ['customer_email', 'id']
  end
end
