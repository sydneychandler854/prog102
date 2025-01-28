
# See notes for first and second exercises (labeling and matching)

# Write a function that turns a vector into a palindrome. For example, it should
# turn 1 2 3 into 1 2 3 3 2 1. Hint:you’ll have to use a function called rev().
# Choose a short but descriptive name for your function.
make_palindrome <- function(x, rev) {
  result <- rev(x)
  return(result)
}

# Why does running this code generate an error?
calc_volume <- function(height, width, depth) {
  area <- height * width
  volume <- area * depth
  return(volume)
}
vol <- calc_volume(3, 5, 1)
area
# There is just a random "area" sitting there, plus the attempt to calculate
# volume looks more like what you'd do to make a collection for volume. The way
# you'd write it correctly is:
calc_volume(3, 5, 1)
