module Sort
  extend self

  def sort(a, bench=nil)
    a = a.dup
    sort!(a)
    a
  end

  private def sort!(a, l = 0, bench=nil)
    return unless l < a.size

    i = l + 1
    while a.size > i
      if a[l] > a[i]
        a[l], a[i] = {a[i], a[l]}
      end
      i += 1
    end

    sort!(a, l + 1)
  end

  private def empty
    [] of Int32
  end
end
