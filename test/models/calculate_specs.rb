require_relative '../test_helper'

describe "Calculate" do

  before do
    @calculate_no_decimal = Calculate.new("5*3+1+6/2+9*100")
    @calculate_with_decimal = Calculate.new("5*3+1+6/85+9*100")
    @calculate_with_subtraction = Calculate.new("1000-5/2-100*7")
    @calculate_division_in_a_row = Calculate.new("100+10/5/2")
    @output_no_decimal = "919"
    @output_with_decimal = "916.07"
    @output_with_subtraction = "297.5"
    @output_division_in_a_row = "101"
  end

  describe "#split_to_array" do
    it "splits a string of math operations into an array split by the operations" do
      split_to_array_length = @calculate_no_decimal.split_to_array.length
      expect(split_to_array_length).to eq(13)
    end
  end

  describe "#perform_ordered_operations" do
    it "performs operations and outputs results with no decimals if it is an integer" do
      expect(@calculate_no_decimal.result).to eq(@output_no_decimal)
    end

    it "performs operations and outputs results with 2 decimals if it not an integer" do
      expect(@calculate_with_decimal.result).to eq(@output_with_decimal)
    end

    it "performs subtraction" do
      expect(@calculate_with_subtraction.result).to eq(@output_with_subtraction)
    end

    it "performs multiply or divide operations that are in a row" do
      expect(@calculate_division_in_a_row.result).to eq(@output_division_in_a_row)
    end
  end

end
