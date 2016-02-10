require "./spec_helper"
require "../src/sort"

class Bench
  property cmps, swaps
  def initialize(@cmps=0, @swaps=0)
  end
end

describe Sort do
  empty = [] of Int32
  big_array = (0..100000).map { rand(100000) }

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

    Sort.sort([3, 2, 1, 4, 5]).should eq([1, 2, 3, 4, 5])
  end

  it "sorts a random array" do
    10.times do
      maxv = 10000
      n = 10000
      a = (0..n).map { rand(maxv) }

      Sort.sort(a).each_cons(2) do |pair|
        x, y = pair
        x.should be <= y
      end
    end
  end

  it "does not modify original array" do
    a = [2, 1]
    Sort.sort(a)
    a.should eq([2, 1])
  end

  it "is fast enough" do
    n = big_array.size
    c = 2.5
    b = Bench.new
    Sort.sort(big_array, b)
    b.cmps.should be < n * Math.log(n) * c
    b.swaps.should be < n * Math.log(n) * c
  end

  it "is fast enough given ordered array" do
    a = Sort.sort(big_array).reverse

    n = big_array.size
    c = 2.5
    b = Bench.new
    Sort.sort(big_array, b)
    b.cmps.should be < n * Math.log(n) * c
    b.swaps.should be < n * Math.log(n) * c
  end
end
