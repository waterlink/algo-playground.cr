module PathFinding
  def self.find_path(graph, start, finish)
    return {true, [start]} if start == finish

    if graph.fetch(start, no_edges).includes?(finish)
      return {true, [start, finish]}
    end

    edges = graph.fetch(start, no_edges)

    i = 0
    while edges.size > i
      if graph.fetch(edges[i], no_edges).includes?(finish)
        return {true, [start, edges[i], finish]}
      end
      i += 1
    end

    {false, empty_path}
  end

  private def self.empty_path
    [] of Int32
  end

  private def self.no_edges
    [] of Int32
  end
end
