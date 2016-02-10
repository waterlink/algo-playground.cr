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

    divided_at = partition(left, right)
    sort!(left, divided_at)
    sort!(divided_at + 1, right)
  end

  private def partition(left, right)
    with_pivot(left, right) do |p|
      (left...right).reduce(left) do |divided_at, i|
        correct_order(p, divided_at, i)
      end
    end
  end

  private def correct_order(p, divided_at, i)
    if bigger(p, i)
      swap(divided_at, i)
      return divided_at + 1
    end

    divided_at
  end

  private def with_pivot(left, right)
    swap(left + rand(right - left), right - 1)

    yield(ary[right - 1]).tap do |divided_at|
      swap(divided_at, right - 1)
    end
  end

  private def empty
    [] of Int32
  end

  private def bigger(x, i)
    bench && bench.cmps += 1
    x > ary[i]
  end

  private def swap(i, j)
    bench && bench.swaps += 1
    ary[i], ary[j] = {ary[j], ary[i]}
  end

  class Bench
    property cmps, swaps
    def initialize(@cmps=0, @swaps=0)
    end
  end
end
