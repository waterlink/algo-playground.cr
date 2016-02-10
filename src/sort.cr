module Sort
  extend self

  def sort(a, bench=nil)
    a = a.dup
    sort!(a, 0, bench)
    a
  end

  private def sort!(a, l, bench)
    return unless l < a.size

    h = l
    h2 = a.size - 1
    i = l + 1
    while a.size > i
      if bigger(a, l, i, bench)
        swap(a, h, i, bench)
        h += 1
      else
        swap(a, h2, i, bench)
        h2 -= 1
      end
      i += 1
    end

    sort!(a, l + 1, bench)
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
