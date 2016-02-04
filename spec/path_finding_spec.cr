require "./spec_helper"
require "../src/path_finding"

describe PathFinding do
  # Since we want to focus on algorithm, lets represent our graph as a
  # Hash(Int32, Int32) for simplicity's sake. And start and finish points are
  # Int32 too.
  #
  # We will start from simple function, that will tell us, if it is possible
  # to reach from start to finish, and if it is returns any path.
  #
  # Then the signature would look like:
  # def self.find_path(graph : Hash(Int32, Int32), start : Int32, finish : Int32)

  describe "#find_path" do
    empty_graph = {} of Int32 => Int32
    empty_path = [] of Int32

    it "finds any path" do
      PathFinding.find_path(empty_graph, 0, 1).should eq({false, empty_path})
    end
  end
end
