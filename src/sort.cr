module Sort
  extend self

  def sort(a, bench=nil)
    a = a.dup
    sort!(a, 0, a.size, bench)
    a
  end

  private def sort!(a, l, r, bench)
    return unless l < r - 1

    p = a[l]

    h = l
    h2 = r - 1

    if h < h2
      if bigger(a, p, h, bench)
        swap(a, h, h2, bench)
        h2 -= 1
      else
        h += 1
      end
    end


    if h < h2
      if bigger(a, p, h, bench)
        swap(a, h, h2, bench)
        h2 -= 1
      else
        h += 1
      end
    end


    if h < h2
      if bigger(a, p, h, bench)
        swap(a, h, h2, bench)
        h2 -= 1
      else
        h += 1
      end
    end

    sort!(a, l + 1, r, bench)
  end

  private def empty
    [] of Int32
  end

  private def bigger(a, x, i, bench)
    bench && bench.cmps += 1
    x > a[j]
  end

  private def swap(a, i, j, bench)
    bench && bench.swaps += 1
    a[i], a[j] = {a[j], a[i]}
  end
end
