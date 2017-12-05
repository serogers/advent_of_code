=begin
  Each square on the grid is allocated in a spiral pattern starting at a location marked 1 and then counting up while spiraling outward. For example, the first few squares are allocated like this:

  17  16  15  14  13
  18   5   4   3  12
  19   6   1   2  11
  20   7   8   9  10
  21  22  23---> ...
  While this is very space-efficient (no squares are skipped), requested data must be carried back to square 1 (the location of the only access port for this memory system) by programs that can only move up, down, left, or right. They always take the shortest path: the Manhattan Distance between the location of the data and square 1.

  For example:

  Data from square 1 is carried 0 steps, since it's at the access port.
  Data from square 12 is carried 3 steps, such as: down, left, left.
  Data from square 23 is carried only 2 steps: up twice.
  Data from square 1024 must be carried 31 steps.
  How many steps are required to carry the data from the square identified in your puzzle input all the way to the access port?

  37  36  35  34  33  32  31
  38  17  16  15  14  13  30
  39  18   5   4   3  12  29
  40  19   6   1   2  11  28
  41  20   7   8   9  10  27
  42  21  22  23  24  25  26
  43  44  45  46  47  48  49
=end


def steps_to_access_port(digit = 0)
  next_root = Math.sqrt(digit).ceil
  next_root += 1 unless next_root.odd? # Next odd root
  perfect_square = next_root**2
  interval = (next_root - 1) / 2 # steps from center

  steps = 0

  4.times do |x| # Each side of the square
    i = x + 1
    upper = perfect_square - ((next_root - 1) * x)
    center = upper - interval
    lower = center - interval

    next unless digit <= upper

    steps = (center - digit).abs + interval
  end

  steps
end

puts steps_to_access_port(1)
puts steps_to_access_port(12)
puts steps_to_access_port(23)
puts steps_to_access_port(1024)