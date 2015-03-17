module AmplMatrix
  module Formatter
    module TwoDimensional
      class Csv
        attr_accessor :input

        def execute
          result = ",#{@input.first[1].keys.join(',')}\n"

          @input.each do |label, row|
            result += "#{label},#{row.values.join(',')}\n"
          end

          return result
        end
      end
    end
  end
end