module Sort
  extend self

  def sort(a)
    a = a.dup
    sort!(a)
    a
  end

  private def sort!(a, l = 0)
    return unless l < a.size

    i = l + 1
    if a.size > i
      if a[l] > a[i]
        a[l], a[i] = {a[i], a[l]}
      end
    end

    sort!(a, l + 1)
  end

  private def empty
    [] of Int32
  end
end
