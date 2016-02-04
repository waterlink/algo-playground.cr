module PathFinding
  def self.find_path(graph, start, finish)
    return {true, [start]} if start == finish

    {false, empty_path}
  end

  private def self.empty_path
    [] of Int32
  end
end
