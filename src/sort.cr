module Sort
  extend self

  def sort(a)
    sort!(a.dup)
  end

  private def sort!(a, l = 0)
    return unless l < a.size

    if a.size > l + 1
      if a[l] > a[l + 1]
        a[l], a[l + 1] = {a[l + 1], a[l]}
      end
    end

    sort!(a, l + 1)
    a
  end

  private def empty
    [] of Int32
  end
end
