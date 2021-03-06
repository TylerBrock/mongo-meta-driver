require "spec_helper"

describe BSON::Ext::FalseClass do

  describe "::BSON_TYPE" do

    it "returns 0x08" do
      expect(FalseClass::BSON_TYPE).to eq(8.chr)
    end
  end

  describe "#bson_type" do

    it "returns the BSON_TYPE" do
      expect(false.bson_type).to eq(FalseClass::BSON_TYPE)
    end
  end

  describe "#to_bson" do

    let(:encoded) do
      false.to_bson
    end

    it "returns the encoded string" do
      expect(encoded).to eq(BSON::NULL_BYTE)
    end
  end

  context "when the class is loaded" do

    let(:registered) do
      BSON::Registry.get(FalseClass::BSON_TYPE)
    end

    it "registers the type" do
      expect(registered).to eq(FalseClass)
    end
  end
end
