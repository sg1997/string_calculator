require 'string_calculator'

describe StringCalculator do
	context "given an non string data type" do
    it "should raise error" do
      expect{StringCalculator.add([1,2,3])}.to raise_error('only string of numbers can be passed')
      expect{StringCalculator.add(1)}.to raise_error('only string of numbers can be passed')
    end
  end

  context "given string of numbers separated with commas or empty string" do
    it "should return 0 with empty string" do
      expect(StringCalculator.add("")).to eq(0)
    end

    it "should return sum of numbers separated by commas" do
      expect(StringCalculator.add("1,2,3")).to eq(6)
      expect(StringCalculator.add("1,2")).to eq(3)
      expect(StringCalculator.add("1,2,3,4,5,6,7,8,9,10")).to eq(55)
    end
  end

end