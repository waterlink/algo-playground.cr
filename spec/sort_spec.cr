require "./spec_helper"
require "../src/sort"

record Bench, cmps, swaps

describe Sort do
  empty = [] of Int32

  it "sorts" do
    Sort.sort(empty).should eq(empty)
    Sort.sort([1]).should eq([1])

    Sort.sort([1, 2]).should eq([1, 2])
    Sort.sort([2, 1]).should eq([1, 2])

    Sort.sort([1, 2, 3]).should eq([1, 2, 3])
    Sort.sort([2, 1, 3]).should eq([1, 2, 3])
    Sort.sort([1, 3, 2]).should eq([1, 2, 3])
    Sort.sort([3, 2, 1]).should eq([1, 2, 3])
  end

  it "does not modify original array" do
    a = [2, 1]
    Sort.sort(a)
    a.should eq([2, 1])
  end
end
