class Sort
  def self.sort(a, bench=nil)
    new(a.dup, bench).sort!
  end

  private getter a, bench
  def initialize(@a, @bench)
  end

  def sort!
    sort!(0, a.size)
    a
  end

  private def sort!(l, r)
    return unless l < r

    h = partition(l, r)
    sort!(l, h)
    sort!(h + 1, r)
  end

  private def partition(l, r)
    with_pivot(l, r) do |p|
      (l...r).reduce(l) do |h, i|
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

  private def with_pivot(l, r)
    swap(l + rand(r - l), r - 1)

    yield(a[r - 1]).tap do |h|
      swap(h, r - 1)
    end
  end

  private def empty
    [] of Int32
  end

  private def bigger(x, i)
    bench && bench.cmps += 1
    x > a[i]
  end

  private def swap(i, j)
    bench && bench.swaps += 1
    a[i], a[j] = {a[j], a[i]}
  end

  class Bench
    property cmps, swaps
    def initialize(@cmps=0, @swaps=0)
    end
  end
end
