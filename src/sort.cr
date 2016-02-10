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

    if l < r
      if bigger(a, p, l, bench)
        swap(a, h, l, bench)
        h += 1
      end
    end

    if l + 1 < r
      if bigger(a, p, l + 1, bench)
        swap(a, h, l + 1, bench)
        h += 1
      end
    end

    swap(a, h, r - 1, bench)
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
