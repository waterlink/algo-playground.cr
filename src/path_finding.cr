module PathFinding
  def self.find_path(graph, start, finish)
    return {true, [start]} if start == finish

    graph.fetch(start, no_edges).each do |hop|
      ok, path = find_path(graph, hop, finish)
      return {true, [start] + path} if ok
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
