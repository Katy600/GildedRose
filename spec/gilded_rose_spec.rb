# require File.join(File.dirname(__FILE__), 'gilded_rose')
require "gilded_rose"
# require "texttest_fixture"

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("fixme", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "fixme"
    end

    it "degrades in quality by one each day as it approaches its sell by date" do
      items = [Item.new("+5 Dexterity Vest", 10, 20)]
      p GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(19)
    end
  end
end
