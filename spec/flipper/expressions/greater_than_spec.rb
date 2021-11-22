require 'helper'

RSpec.describe Flipper::Expressions::GreaterThan do
  describe "#evaluate" do
    it "returns false when equal" do
      expression = described_class.new([
        Flipper::Expressions::Value.new([2]),
        Flipper::Expressions::Value.new([2]),
      ])

      expect(expression.evaluate).to be(false)
    end

    it "returns true when greater" do
      expression = described_class.new([
        Flipper::Expressions::Value.new([2]),
        Flipper::Expressions::Value.new([1]),
      ])

      expect(expression.evaluate).to be(true)
    end

    it "returns false when less" do
      expression = described_class.new([
        Flipper::Expressions::Value.new([1]),
        Flipper::Expressions::Value.new([2]),
      ])

      expect(expression.evaluate).to be(false)
    end
  end

  describe "#value" do
    it "returns Hash" do
      expression = described_class.new([
        Flipper.value(20),
        Flipper.value(10),
      ])

      expect(expression.value).to eq({
        "GreaterThan" => [
          {"Value" => [20]},
          {"Value" => [10]},
        ],
      })
    end
  end
end