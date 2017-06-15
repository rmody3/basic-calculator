class Calculate
  attr_reader :result

  def initialize(input)
    @input = input
    split_to_array
    calculate_result
  end

  def split_to_array
    #remove whitspace
    @input = @input.delete(" ")
    #split to array
    @array_input = @input.split(/(\*|\+|\/|-)/)
  end

  def calculate_result
    mult_div_index = @array_input.find_index{|n| n.to_s.match(/\*|\/|-/)}
    if !mult_div_index
      @result = sprintf("%g", @array_input.reduce(0) {|sum, n| sum+n.to_f }.round(2))

    elsif @array_input[mult_div_index] == "*"
      mult_result = @array_input[mult_div_index-1].to_f * @array_input[mult_div_index+1].to_f
      @array_input[mult_div_index-1] = mult_result
      @array_input.slice!(mult_div_index,2)

      calculate_result

    elsif @array_input[mult_div_index] == "/"
      div_result = @array_input[mult_div_index-1].to_f / @array_input[mult_div_index+1].to_f

      @array_input[mult_div_index-1] = div_result

      @array_input.slice!(mult_div_index,2)

      calculate_result

    elsif @array_input[mult_div_index] == "-"
      sub_result = @array_input[mult_div_index+1].to_f * -1
      @array_input[mult_div_index+1] = div_result
      @array_input.slice!(mult_div_index,1)

      calculate_result

    end
  end
end
