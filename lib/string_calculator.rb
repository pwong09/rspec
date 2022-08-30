class StringCalculator

  def self.add(input)
    if input.empty?
      0
    else
      # split the string
      # convert string to numbers
      # add them
      numbers = input.split(',').map{ |num| num.to_i}
      numbers.inject(0) { |sum, number| sum + number}
    end
  end
end
