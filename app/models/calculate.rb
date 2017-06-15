class Calculate
  attr_reader :result

  #initialize with string input and call instance methods to get result
  def initialize(input)
    @input = input
    split_to_array
    perform_ordered_operations
  end

  #split string input to array including operations as elements
  def split_to_array
    @input = @input.delete(" ")
    @input_as_array = @input.split(/(\*|\+|\/|-)/)
  end

  #use recursion to find first instance of *,/, - and perform operation, base case is when only addition is left then sum
  def perform_ordered_operations
    non_add_index = @input_as_array.find_index{|n| ["*","-","/"].include?(n.to_s) }

    if !non_add_index
      #round to 2 decimal places unless decimal is 0, and convert to string
      @result = sprintf("%g", @input_as_array.reduce(0) {|sum, n| sum+n.to_f }.round(2))

    elsif @input_as_array[non_add_index] == "*"
      mult_result = @input_as_array[non_add_index-1].to_f * @input_as_array[non_add_index+1].to_f
      replace_operation_of_array(mult_result, non_add_index-1, 2)
      perform_ordered_operations

    elsif @input_as_array[non_add_index] == "/"
      div_result = @input_as_array[non_add_index-1].to_f / @input_as_array[non_add_index+1].to_f
      replace_operation_of_array(div_result, non_add_index-1, 2)
      perform_ordered_operations

    #for subtraction convert number to negative so operation becomes an addition
  elsif @input_as_array[non_add_index] == "-"
      sub_result = @input_as_array[non_add_index+1].to_f * -1
      replace_operation_of_array(sub_result, non_add_index, 1)
      perform_ordered_operations

    end
  end

  private

  #replace the single operation with the result
  def replace_operation_of_array(result, start_index, length)
    @input_as_array[start_index] = result
    @input_as_array.slice!(start_index+1,length)
  end

end
