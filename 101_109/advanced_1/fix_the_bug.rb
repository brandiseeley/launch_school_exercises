def my_method(array)
  if array.empty?
    []
  elsif array.size > 1
    # array.map is our conditional, which will evaluate to true
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])

# Expected output
# []
# [21]
# [9, 16]
# [25, 36, 49]

=begin

On line 4 of our original code we have an elsif branch.
In ruby, the expression immediately following our if/elsif
statement is utilized as the conditional, whether
or not it is on the same line as the if/elsif. In this
case, the call to Array#map is the conditional expression.
Array#map returns a new array, which will evaluate to true.
Therefore the code within the elsif branch will execute, where 
there is no code. Our method definition is exclusively an if/elsif/else
conditional, meaning our elsif branch is the last executed expression
and therefore the return value of our entire method invokation is nil.

When we add the proper conditional statement `elsif array.size > 1`, we get the expected return
values from our method calls. 

=end
