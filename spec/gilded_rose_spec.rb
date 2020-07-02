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
        end
    end
end