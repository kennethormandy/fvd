module FontVariationDescription
  class Compactor

    def initialize(properties=PROPERTIES, values=VALUES)
      @properties = properties
      @values = values
    end

    def parse(input)
      result = ['n', '4']
      descriptors = input.split(';')

      descriptors.each { |descriptor|
        pair = descriptor.gsub(/\s+/, '').split(':')
        if pair.size == 2
          property, value = pair
          if item = get_item(property)
            item.compact(result, value)
          end
        end
      }

      result.join('')
    end

  protected

    def get_item(property)
      if index = @properties.index(property)
        values = @values[property]
        Item.new(index, property, values)
      end
    end

  end
end