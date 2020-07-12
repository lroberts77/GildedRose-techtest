require 'gilded_rose'

describe GildedRose do

    describe "#update_quality" do

        context "Generic item" do

            it "does not change the name" do
                items = [Item.new("foo", 0, 0)]
                GildedRose.new(items).update_quality()
                expect(items[0].name).to eq "foo"
            end

            it "All items have a sell_in date which decreases by 1 each day" do
                items = [Item.new("item", 6, 25)]
                GildedRose.new(items).update_quality()
                GildedRose.new(items).update_quality()
                expect(items[0].sell_in).to eq (4)
            end

            it "item has quality value which decreases each day" do
                items = [Item.new("item", 10, 10)]
                GildedRose.new(items).update_quality()
                expect(items[0].quality).to eq (9)
            end

            it "item has quality value which is never negative" do
                items = [Item.new("item", 10, 0)]
                GildedRose.new(items).update_quality()
                GildedRose.new(items).update_quality()
                expect(items[0].quality).to eq (0)
            end

            it "item has quality value which decreases by 2 each day after sell_in date" do
                items = [Item.new("item", 0, 10)]
                GildedRose.new(items).update_quality()
                expect(items[0].quality).to eq (8)
            end
        end

        context "Aged Brie" do

            it "item quality is never more than 50" do
              items = [Item.new("Aged Brie", 6, 50)]
              GildedRose.new(items).update_quality()
              GildedRose.new(items).update_quality()
              expect(items[0].quality).to eq (50)
            end
        end
    end
end