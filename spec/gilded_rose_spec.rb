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

    context '+5 Dexterity Vest' do
      it "degrades in quality by one each day as it approaches its sell by date" do
        items = [Item.new("+5 Dexterity Vest", 10, 20)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(19)
      end

      it "degrades twice as fast after its sell by date" do
        items = [Item.new("+5 Dexterity Vest", 10, 20)]
        12.times {GildedRose.new(items).update_quality()}
        expect(items[0].quality).to eq(6)
      end

      it "the quality is never negative" do
        items = [Item.new("+5 Dexterity Vest", 10, 20)]
        25.times {GildedRose.new(items).update_quality()}
        expect(items[0].quality).to eq(0)
      end
    end

      context 'Aged Brie' do
        it "increases in quality by one, each day as, it approaches its sell by date" do
          items = [Item.new("Aged Brie", 2, 0)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq(1)
        end

      end

  end
end
