class StringCalculator
	def self.add(numbers)
		raise 'only string of numbers can be passed' unless numbers.class.eql?(String)

		nos = numbers.split(/[^0-9-]+/)
		nos = nos.map(&:to_i)
		any_negative_no = contains_negative_number(nos)		
		raise 'negative numbers not allowed in the string' if any_negative_no

		nos.inject(0){|sum,x| x <= 1000? sum + x : sum }
	end

	private

	def self.contains_negative_number(nos)
		nos.select { |a| a < 0 }.size > 0
	end
end