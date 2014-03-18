# MultiplicationTable can generate and print simple multiplication tables based on a single
# list of numbers. The current implementation can only handle symmetrical tables, i.e. 
# tables that have the same numbers across the first row and column
#
# Usage:
# table = MultiplicationTable.new([1,2,3,4,5])
# table.print_table
#  => 1  2  3  4  5
#  => 2  4  6  8 10
#  => 3  6  9 12 15
#  => 4  8 12 16 20
#  => 5 10 15 20 25
#
# The table is created in memory when an instance is initialized; this may result in heavy
# memory usage for extremely large tables, but it allows for a more efficient generation
# of table values.
#
class MultiplicationTable

  attr_reader :table

  def initialize(numbers)
    @table = generate_table(numbers)
  end

  def print_table(outstream=$stdout)
    outstream.puts self.to_s  
  end

  def to_a
    table
  end

  def to_s
    @table_str ||= convert_table_to_string
  end

  private

  # This is a slightly more complicated approach to generating the table, but it avoids
  # the N^2 problem of a naive implementation. Here, we start with a correctly-sized
  # two-dimensional array, and move down diagonally from the top left. From each of the
  # cells in the diagonal, the numbers are the same across the rest of the row and the 
  # column, so we do the calculation once, and write the value into the two cells 
  # together, e.g.
  #
  # 1   2   3   4
  #
  # 2   4---6---8
  #     |
  # 3   6   9  12
  #     | 
  # 4   8  12  16
  # 
  def generate_table(numbers)
    table = Array.new(numbers.size) { Array.new(numbers.size) } 
    (0...numbers.length).each_with_object(table) do |i, table| 
      multiplier = (i == 0 ? 1 : numbers[i])
      table[i][i] = numbers[i] * multiplier
      fill_rest_of_row_and_column(table, numbers, i, multiplier)
    end
  end

  def fill_rest_of_row_and_column(table, numbers, current_index, multiplier)
    (current_index...numbers.length).each do |i| 
       table[current_index][i] = table[i][current_index] = multiplier * numbers[i]  
    end
  end

  def convert_table_to_string
    cell_width = max_width_of_numbers_in_table
    table.inject('') do |table_str,row| 
      table_str += create_string_from_row(row, cell_width) + "\n" 
    end
  end

  def create_string_from_row(row, cell_width)
    row.inject('') do |row_str,cell| 
      row_str += cell.to_s.rjust(cell_width) + ' '
    end     
  end

  def max_width_of_numbers_in_table
    max_cell = table[0].size - 1
    (table[max_cell][max_cell]).to_s.length
  end

end
