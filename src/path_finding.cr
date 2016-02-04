module PathFinding
  def self.find_path(graph, start, finish)
    if graph.fetch(start, [start]).first == finish
      return {true, [start, finish]}
    end

    {false, empty_path}
  end

  private def self.empty_path
    [] of Int32
  end
end
