class StringCalculator
	def self.add(numbers)
		raise 'only string of numbers can be passed' unless numbers.class.eql?(String)
		nos = numbers.split(',')
		nos = nos.map(&:to_i)
		nos.sum
	end
end