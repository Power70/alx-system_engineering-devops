#!/usr/bin/env ruby

# Check if an argument is provided
if ARGV.length != 1
  puts "Usage: #{$PROGRAM_NAME} <string>"
  exit 1
end

# Regular expression to match "School"
regex = /School/

# Extract the argument
input_string = ARGV[0]

# Match the regular expression
match_result = regex.match(input_string)

# Print the result
if match_result
  puts match_result[0] + "$"
else
  puts "$"
end

