module Sort
  extend self

  def sort(a, bench=nil)
    a = a.dup
    sort!(a, 0, a.size, bench)
    a
  end

  private def sort!(a, l, r, bench)
    return unless l < r

    p = a[r - 1]
    h = l

    i = l
    while i < r
      if bigger(a, p, i, bench)
        swap(a, h, i, bench)
        h += 1
      end
      i += 1
    end

    swap(a, h, r - 1, bench)

    sort!(a, l, h, bench)
    sort!(a, h + 1, r, bench)
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
