module TurboCassandra
  module Controller
    class Template
      private
      def calculate_path root, filename
        root.gsub("rest/turbo", "") + 'views/mailer/' + filename
      end

      public
      def load root, params
        content = {type: 'html'}
        filename = calculate_path(root, params['name'])
        content[:file] = File.read(filename)
        content['filename'] = filename
        content
      end

      def save body
        file_object = JSON.parse body
        IO.write(file_object['filename'], file_object['file'])
      end

    end
  end
end