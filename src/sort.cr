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
      if less_or_eq(a, p, l, bench)
        swap(a, h, l, bench)
      end
    end

    if l + 1 < r
      if less_or_eq(a, p, l + 1, bench)
        swap(a, h, l + 1, bench)
      end
    end
  end

  private def empty
    [] of Int32
  end

  private def less_or_eq(a, x, i, bench)
    bench && bench.cmps += 1
    x <= a[i]
  end

  private def swap(a, i, j, bench)
    bench && bench.swaps += 1
    a[i], a[j] = {a[j], a[i]}
  end
end
