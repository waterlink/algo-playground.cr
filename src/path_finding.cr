module PathFinding
  def self.find_path(graph, start, finish)
    return {true, [start]} if start == finish

    if graph.fetch(start, noedges).first == finish
      return {true, [start, finish]}
    end

    {false, empty_path}
  end

  private def self.empty_path
    [] of Int32
  end

  private def self.noedges
    [] of Int32
  end
end
