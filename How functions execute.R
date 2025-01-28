# Functions act as black boxes (separate universe, don't see outside)
# Parameters and returns are our bridges into and out of the black box
# Debugger = a useful way to peek inside the box

# The black box = encapsulation

gt_threshold <- function(x, threshold) {
  is_gt <- x > threshold
  result <- sum(is_gt)
  return(result)
}

temperatures <- c(18.1, 29.9, 22.3, 25.2)
gt_threshold(temperatures, 25)

#Dig in with the debugger browser()
gt_threshold <- function(x, threshold) {
  browser()
  is_gt <- x > threshold
  result <- sum(is_gt)
  return(result)
}
gt_threshold(temperatures, 25)

# Changing the parameter values in the function will not change the original
# input.
gt_threshold <- function(x, threshold) {
  is_gt <- x > threshold
  result <- sum(is_gt)
  x <- "new x"
  return(result)
}
gt_threshold(temperatures, 25)

# Functions operate in their own little universe/"black box"
# Parameters are how we let information in
# return() is how we let information back out
