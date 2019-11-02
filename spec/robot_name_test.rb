
require_relative("../lib/robot_name")

RSpec.describe Robot do
  NAME_REGEXP = /^[A-Z]{2}\d{3}$/
  before { Robot.forget }
  it("can create a robot") { expect(Robot.new).to_not be_nil }
  it("has name") { expect(Robot.new.name).to(match(NAME_REGEXP)) }
  it("name sticks") do
    robot = Robot.new
    original_name = robot.name
    expect(robot.name).to(eq(original_name))
  end
  it("reset changes name") do
    robot = Robot.new
    original_name = robot.name
    robot.reset
    expect(robot.name).to_not(eq(original_name))
  end
  it("reset before name called does not cause an error") do
    robot = Robot.new
    robot.reset
    expect(Robot.new.name).to(match(NAME_REGEXP))
  end
  it("reset multiple times") do
    robot = Robot.new
    names = []
    5.times do
      robot.reset
      (names << robot.name)
    end
    expect((names.uniq.size > 1)).to(be_truthy)
  end
  it("different robots have different names") do
    expect(Robot.new.name).to_not(eq(Robot.new.name))
  end
  it("different name when chosen name is taken") do
    same_seed = 1234
    Kernel.srand(same_seed)
    robot_1 = Robot.new
    name_1 = robot_1.name
    Kernel.srand(same_seed)
    robot_2 = Robot.new
    name_2 = robot_2.name
    expect(name_2).to_not(eq(name_1))
  end
  it("generate all robots") do
    all_names_count = ((26 * 26) * 1000)
    time_limit = (Time.now + 60)
    seen_names = Hash.new(0)
    robots = []
    while (seen_names.size < all_names_count) and (Time.now < time_limit) do
      robot = Robot.new
      seen_names[robot.name] += 1
      (robots << robot)
    end
    timeout_message = "Timed out trying to generate all possible robots"
    expect(robots.size).to(eq(all_names_count))
    expect(seen_names.values.all? { |count| (count == 1) }).to(be_truthy)
    expect(seen_names.keys.all? { |name| name.match(NAME_REGEXP) }).to(be_truthy)
  end
end
