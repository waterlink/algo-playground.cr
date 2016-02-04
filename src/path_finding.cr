module PathFinding
  def self.find_path(graph, start, finish)
    return {true, [start]} if start == finish

    if graph.fetch(start, no_edges).includes?(finish)
      return {true, [start, finish]}
    end

    graph.fetch(start, no_edges).each do |hop|
      if graph.fetch(hop, no_edges).includes?(finish)
        return {true, [start, hop, finish]}
      end
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
