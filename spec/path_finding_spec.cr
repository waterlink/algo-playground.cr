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
  # def self.find_path(graph : Hash(Int32, Array(Int32)), start : Int32,
  # finish : Int32)

  describe "#find_path" do
    empty_graph = {} of Int32 => Array(Int32)
    empty_path = [] of Int32

    it "finds any path" do
      PathFinding.find_path(empty_graph, 0, 1).should eq({false, empty_path})
      PathFinding.find_path(empty_graph, 0, 0).should eq({true, [0]})
      PathFinding.find_path({0 => [1]}, 0, 1).should eq({true, [0, 1]})
      PathFinding.find_path({0 => [1, 2]}, 0, 1).should eq({true, [0, 1]})
      PathFinding.find_path({0 => [2, 1]}, 0, 1).should eq({true, [0, 1]})

      PathFinding.find_path({0 => [1], 1 => [2]}, 1, 2)
        .should eq({true, [1, 2]})

      PathFinding.find_path({0 => [1], 1 => [2]}, 0, 2)
        .should eq({true, [0, 1, 2]})

      PathFinding.find_path({0 => [1], 1 => [3, 2, 4]}, 0, 2)
        .should eq({true, [0, 1, 2]})
    end
  end
end
