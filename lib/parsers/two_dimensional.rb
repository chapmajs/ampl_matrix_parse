module AmplMatrix
  module Parser
    class TwoDimensional
      attr_accessor :input, :result_hash, :variable

      def initialize
        @result_hash = {}
        @variable = false
      end

      def parse
        found = !@variable

        all_headers = []
        headers = []
        header_remap = {}

        @input.each do |line|
          if @variable && variable_declaration = line.match(/^(\S+) \[.*/)
            found = variable_declaration.captures[0] == @variable
          elsif found && match = line.match(/^# (\$\d+) = (\S+)/)
            header_remap[match.captures[0]] = match.captures[1]
          elsif found && header_line = line.match(/^:(.*):=$/)
            raw_headers = header_line.captures[0].strip.split(" ")
            headers = raw_headers.collect { |h| h.start_with?('$') ? header_remap[h] : h }

            all_headers += headers
          elsif found && data_line = line.match(/^(\S+) (.*\d$)/)
            row_key = data_line.captures[0]
            values = data_line.captures[1].strip.split(" ")

            @result_hash[row_key] ||= {}

            headers.each_with_index { |h, idx| @result_hash[row_key][h] = values[idx] }
          end
        end
      end
    end
  end
end