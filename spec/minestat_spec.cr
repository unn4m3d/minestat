require "./spec_helper"

describe MineStat do
  # TODO: Write tests

  it "works" do
    data = MineStat::Data.new("srv1.morokmc.ru", 25600u32)
    data.online.should eq(true)
  end
end
