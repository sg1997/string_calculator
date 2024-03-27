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

    it "should return the number itself when given a single number only" do
      expect(StringCalculator.add('2')).to eq(2)
      expect(StringCalculator.add('3')).to eq(3)
    end
  end

  context "given different delimeters in a string of numbers" do
    it "should return sum of numbers when \n added " do
      expect(StringCalculator.add("1\n,2,3")).to eq(6)
      expect(StringCalculator.add("1,\n")).to eq(1)
    end

    it "should return sum of integer numbers when different delimeter is given" do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
      expect(StringCalculator.add("//;2\n;32;4//")).to eq(38)
    end
  end


  it "should raise error if string contains negative number" do
    expect{StringCalculator.add("1,2,-3")}.to raise_error('negative numbers not allowed in the string')
    expect{StringCalculator.add("1\n,-2,3")}.to raise_error('negative numbers not allowed in the string')
    expect{StringCalculator.add("//;-2\n;32;4//")}.to raise_error('negative numbers not allowed in the string')
  end 

end