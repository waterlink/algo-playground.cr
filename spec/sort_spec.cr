require "./spec_helper"
require "../src/sort"

describe Sort do
  empty = [] of Int32
  big_array = ->(n : Int32, m : Int32) { (0..n).map { rand(m) } }

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

  it "works with duplicated items" do
    Sort.sort([3, 2, 1, 1, 3, 4, 2]).should eq([1, 1, 2, 2, 3, 3, 4])
  end

  it "sorts a random array" do
    10.times do
      a = big_array.call(10000, 1000)

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
    a = big_array.call(1000000, 100000)

    n = a.size
    c = 2.5
    b = Sort::Bench.new
    Sort.sort(a, b)
    b.cmps.should be < n * Math.log(n) * c
    b.swaps.should be < n * Math.log(n) * c
  end

  it "handles ordered array quickly" do
    a = Sort.sort(big_array.call(1000, 100))

    n = a.size
    c = 2.5
    b = Sort::Bench.new
    Sort.sort(a, b)
    b.cmps.should be < n * Math.log(n) * c
    b.swaps.should be < n * Math.log(n) * c
  end
end
