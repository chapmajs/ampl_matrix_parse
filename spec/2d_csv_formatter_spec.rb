require File.dirname(__FILE__) + '/../lib/parsers/two_dimensional.rb'
require File.dirname(__FILE__) + '/../lib/formatters/two_dimensional/csv.rb'

RSpec.describe "AmplMatrix::Formatter::TwoDimensional::Csv" do
  let(:parser) { AmplMatrix::Parser::TwoDimensional.new }

  context "when a 2D matrix with integer labels is loaded, parsed and plugged into a CSV formatter" do
    let(:formatter) { AmplMatrix::Formatter::TwoDimensional::Csv.new }
    let(:csv) { formatter.execute }

    before(:each) do
      parser.input = TestDataLoader.load(:two_dimensional_int_headers)
      parser.parse
      formatter.input = parser.result_hash
    end

    it { expect(csv).to eq ",1,2\n3,5,6\n4,7,8\n" }
  end
end