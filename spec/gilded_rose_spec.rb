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

        it "increases in quality twice as fast after its sell by date" do
          items = [Item.new("Aged Brie", 2, 0)]
          4.times {GildedRose.new(items).update_quality()}
          expect(items[0].quality).to eq(6)
        end

        it "it is never greater then 50" do
          items = [Item.new("Aged Brie", 2, 0)]
          100.times {GildedRose.new(items).update_quality()}
          expect(items[0].quality).to eq(50)
        end
      end

      context 'Sulfuras' do

        it "always remains at 80" do
          items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 80)]
          40.times {GildedRose.new(items).update_quality()}
          expect(items[0].quality).to eq(80)
        end

        it "always remains at 80" do
          items = [Item.new("Sulfuras, Hand of Ragnaros", -1, 80)]
          40.times {GildedRose.new(items).update_quality()}
          expect(items[0].quality).to eq(80)
        end
      end
      context 'Backstage passes' do
        it "increases in quality by 1 before 10 days or less" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq(21)
        end

        it "increases in quality by 2 after 10 days or less" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)]
          6.times{GildedRose.new(items).update_quality()}
          expect(items[0].quality).to eq(27)
        end

        it "increases in quality by 3 after 5 days or less" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)]
          13.times{GildedRose.new(items).update_quality()}
          expect(items[0].quality).to eq(44)
        end

    end
  end
end
