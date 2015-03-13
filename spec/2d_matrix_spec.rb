require File.dirname(__FILE__) + '/../lib/parsers/two_dimensional.rb'

RSpec.describe "AmplMatrix::Parser::TwoDimensional" do
  let(:parser) { AmplMatrix::Parser::TwoDimensional.new }

  context "when a 2D matrix with integer labels is loaded and parsed" do
    before(:each) do
      parser.input = TestDataLoader.load(:two_dimensional_int_headers)
      parser.parse
    end

    it { expect(parser.result_hash['3']['1']).to eq '5' }
    it { expect(parser.result_hash['3']['2']).to eq '6' }
    it { expect(parser.result_hash['4']['1']).to eq '7' }
    it { expect(parser.result_hash['4']['2']).to eq '8' }
  end

  context "when a 2D matrix with integer labels and substitution is loaded and parsed" do
    before(:each) do
      parser.input = TestDataLoader.load(:two_dimensional_int_headers_with_substitution)
      parser.parse
    end

    it { expect(parser.result_hash['3']['1']).to eq '5' }
    it { expect(parser.result_hash['3']['2']).to eq '6' }
    it { expect(parser.result_hash['4']['1']).to eq '7' }
    it { expect(parser.result_hash['4']['2']).to eq '8' }
  end

  context "when a 2D matrix with mixed string and integer labels is loaded and parsed" do
    before(:each) do
      parser.input = TestDataLoader.load(:two_dimensional_mixed_headers)
      parser.parse
    end

    it { expect(parser.result_hash['r1']['1']).to eq '1' }
    it { expect(parser.result_hash['r1']['lol']).to eq '2' }
    it { expect(parser.result_hash['r1']['wat']).to eq '3e-1' }
    it { expect(parser.result_hash['r2']['1']).to eq '4' }
    it { expect(parser.result_hash['r2']['lol']).to eq '5' }
    it { expect(parser.result_hash['r2']['wat']).to eq '6' }
  end

  context "when more than one variable is contained in the input" do
    before(:each) do
      parser.input = TestDataLoader.load(:two_dimensional_multi_variable)
      parser.variable = 'the_other_variable'
      parser.parse
    end

    it { expect(parser.result_hash['r2']['1']).to eq '1' }
    it { expect(parser.result_hash['r2']['lol']).to eq '2' }
    it { expect(parser.result_hash['r2']['wat']).to eq '3e-1' }
    it { expect(parser.result_hash['r1']['1']).to eq '4' }
    it { expect(parser.result_hash['r1']['lol']).to eq '5' }
    it { expect(parser.result_hash['r1']['wat']).to eq '6' }

    it { expect(parser.result_hash['r3']).to be_nil }
    it { expect(parser.result_hash['r4']).to be_nil }
  end

  context "when a 2D matrix is split into multiple parts" do
    before(:each) do
      parser.input = TestDataLoader.load(:two_dimensional_split_display)
      parser.parse
    end

    it { expect(parser.result_hash['r1']['1']).to eq '9' }
    it { expect(parser.result_hash['r1']['lol']).to eq '8' }
    it { expect(parser.result_hash['r1']['wat']).to eq '7e-1' }
    it { expect(parser.result_hash['r1']['2']).to eq '3' }
    it { expect(parser.result_hash['r1']['3']).to eq '2' }
    it { expect(parser.result_hash['r1']['4']).to eq '1e-1' }
    it { expect(parser.result_hash['r2']['1']).to eq '4' }
    it { expect(parser.result_hash['r2']['lol']).to eq '5' }
    it { expect(parser.result_hash['r2']['wat']).to eq '6' }
    it { expect(parser.result_hash['r2']['2']).to eq '1' }
    it { expect(parser.result_hash['r2']['3']).to eq '2' }
    it { expect(parser.result_hash['r2']['4']).to eq '0' }
  end
end