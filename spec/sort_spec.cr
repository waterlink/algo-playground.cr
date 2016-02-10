require "./spec_helper"
require "../src/sort"

record Bench, cmps, swaps do
  setter cmps, swaps
end

describe Sort do
  empty = [] of Int32
  big_array = (0..n).map { rand(100) }

  it "sorts distinct items" do
    Sort.sort(empty).should eq(empty)
    Sort.sort([1]).should eq([1])

    Sort.sort([1, 2]).should eq([1, 2])
    Sort.sort([2, 1]).should eq([1, 2])

    Sort.sort([1, 2, 3]).should eq([1, 2, 3])
    Sort.sort([1, 3, 2]).should eq([1, 2, 3])
    Sort.sort([2, 1, 3]).should eq([1, 2, 3])
    Sort.sort([2, 3, 1]).should eq([1, 2, 3])
    Sort.sort([3, 2, 1]).should eq([1, 2, 3])
    Sort.sort([3, 1, 2]).should eq([1, 2, 3])

    Sort.sort([4, 3, 2, 1]).should eq([1, 2, 3, 4])
  end

  it "sorts a random array" do
    maxv = 100
    n = 100
    a = (0..n).map { rand(maxv) }

    Sort.sort(a).each_cons(2) do |pair|
      x, y = pair
      pp pair
      x.should be <= y
    end
  end

  it "does not modify original array" do
    a = [2, 1]
    Sort.sort(a)
    a.should eq([2, 1])
  end

  it "is fast enough" do
    b = Bench.new(0, 0)
    Sort.sort([3, 2, 1], b)
    b.cmps.should be < 5
    b.swaps.should be < 3
  end
end
