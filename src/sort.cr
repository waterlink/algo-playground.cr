module Sort
  extend self

  def sort(a, bench=nil)
    a = a.dup
    sort!(a, 0, a.size, bench)
    a
  end

  private def sort!(a, l, r, bench)
    return unless l < r - 1

    if bigger(a, l, r - 1, bench)
      swap(a, l, r - 1, bench)
    end
  end

  private def empty
    [] of Int32
  end

  private def bigger(a, i, j, bench)
    bench && bench.cmps += 1
    a[i] > a[j]
  end

  private def swap(a, i, j, bench)
    bench && bench.swaps += 1
    a[i], a[j] = {a[j], a[i]}
  end
end
