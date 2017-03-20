module TurboCassandra
  module WebAPI
    module Attribute
      module AttributeAddOption
        def prepare_option option
            option['option']['label']
        end
          def _add_option attribute_code, option
              @attribute_api.update_attribute attribute_code, prepare_option(option)
            {
                value: prepare_option(option)
            }
          end
      end
    end
  end
  end