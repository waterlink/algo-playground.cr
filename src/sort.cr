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

  private def sort!(left, r)
    return unless left < r

    h = partition(left, r)
    sort!(left, h)
    sort!(h + 1, r)
  end

  private def partition(left, r)
    with_pivot(left, r) do |p|
      (left...r).reduce(left) do |h, i|
        correct_order(p, h, i)
      end
    end
  end

  private def correct_order(p, h, i)
    if bigger(p, i)
      swap(h, i)
      return h + 1
    end

    h
  end

  private def with_pivot(left, r)
    swap(left + rand(r - left), r - 1)

    yield(ary[r - 1]).tap do |h|
      swap(h, r - 1)
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
