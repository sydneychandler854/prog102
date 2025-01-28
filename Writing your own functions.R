# Functions have 2 purposes: encapsulation and applying the same code to new
# inputs (reusability) Syntax: important to recognize Cognitive Load for the
# human brain <7 items Use parameters (part of code that can change) instead of
# copy-paste-edit workload. Same logic, same function, different inputs.
# Syntax: Name, keyword function, parameters, body {}, return output

function_name <- function(inputs) {
  output_value <- do_something(inputs)
}

square <- function(x) {
  result <- x^2
  return(result)
}

square(3)
y <- 4
square(y)
square(y+1)

nth_power <- function(x, n) {
  result <- x^n
  return(result)
}
nth_power(3, 2)
nth_power(3, 4)


gt_threshold <- function(x, threshold) {
  is_gt <- x > threshold
  result <- sum(is_gt)
  return(result)
}
gt_threshold(c(1, 2, 4), 3)

# Functions make code readable by hiding details (encapsulation)
# Functions make code reusable by allowing different inputs (parameters)
# Syntax - every function definition has 5 parts
