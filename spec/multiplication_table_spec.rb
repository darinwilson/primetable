require_relative 'spec_helper'

describe MultiplicationTable do

  it "generates a multiplication table from a single list of numbers" do
    table = [
      [ 2,  3,  5,  7, 11, 13],
      [ 3,  9, 15, 21, 33, 39],
      [ 5, 15, 25, 35, 55, 65],
      [ 7, 21, 35, 49, 77, 91],
      [11, 33, 55, 77,121,143],
      [13, 39, 65, 91,143,169]
    ]
    mult_table = MultiplicationTable.new(table[0])
    expect(mult_table.to_a).to eq(table) 
  end  

end
