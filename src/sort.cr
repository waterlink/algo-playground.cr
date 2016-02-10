module Sort
  extend self

  def sort(a, bench=nil)
    a = a.dup
    sort!(a, 0, a.size, bench)
    a
  end

  private def sort!(a, l, r, bench)
    return unless l < r

    h = partition(a, l, r, bench)
    sort!(a, l, h, bench)
    sort!(a, h + 1, r, bench)
  end

  private def partition(a, l, r, bench)
    with_pivot(a, l, r, bench) do |p|
      h = l
      (l...r).each do |i|
        h = correct_order(a, p, h, i, bench)
      end
      h
    end
  end

  private def correct_order(a, p, h, i, bench)
    if bigger(a, p, i, bench)
      swap(a, h, i, bench)
      return h + 1
    end

    h
  end

  private def with_pivot(a, l, r, bench)
    swap(a, l + rand(r - l), r - 1, bench)
    h = yield(a[r - 1])
    swap(a, h, r - 1, bench)
    h
  end

  private def empty
    [] of Int32
  end

  private def bigger(a, x, i, bench)
    bench && bench.cmps += 1
    x > a[i]
  end

  private def swap(a, i, j, bench)
    bench && bench.swaps += 1
    a[i], a[j] = {a[j], a[i]}
  end
end
