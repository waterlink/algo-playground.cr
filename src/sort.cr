class Sort
  def self.sort(ary, bench=nil)
    new(ary.dup, bench).sort!
  end

  private getter ary, bench
  def initialize(@ary, bench)
    @bench = bench || Bench.new
  end

  def sort!
    sort!(0, ary.size)
    ary
  end

  private def sort!(left, right)
    return unless left < right

    split_at = partition(left, right)
    sort!(left, split_at)
    sort!(split_at + 1, right)
  end

  private def partition(left, right)
    with_pivot(left, right) do |pivot|
      (left...right).reduce(left) do |split_at, index|
        correct_order(pivot, split_at, index)
      end
    end
  end

  private def correct_order(pivot, split_at, index)
    if bigger(pivot, index)
      swap(split_at, index)
      return split_at + 1
    end

    split_at
  end

  private def with_pivot(left, right)
    swap(left + rand(right - left), right - 1)

    yield(ary[right - 1]).tap do |split_at|
      swap(split_at, right - 1)
    end
  end

  private def empty
    [] of Int32
  end

  private def bigger(x, index)
    bench && bench.cmps += 1
    x > ary[index]
  end

  private def swap(index, index_2)
    bench && bench.swaps += 1
    ary[index], ary[index_2] = {ary[index_2], ary[index]}
  end

  class Bench
    property cmps, swaps
    def initialize(@cmps=0, @swaps=0)
    end
  end
end
