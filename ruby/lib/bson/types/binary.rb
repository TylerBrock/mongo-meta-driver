# encoding: utf-8
module BSON

  # Represents binary data.
  #
  # @see http://bsonspec.org/#/specification
  #
  # @since 2.0.0
  class Binary

    # A binary is type 0x05 in the BSON spec.
    #
    # @since 2.0.0
    BSON_TYPE = 5.chr.freeze

    # The mappings of subtypes to their single byte identifiers.
    #
    # @since 2.0.0
    SUBTYPES = {
      :generic => 0.chr,
      :function => 1.chr,
      :old => 2.chr,
      :uuid_old => 3.chr,
      :uuid => 4.chr,
      :md5 => 5.chr,
      :user => 128.chr
    }.freeze

    # The mappings of single byte subtypes to their symbol counterparts.
    #
    # @since 2.0.0
    TYPES = SUBTYPES.invert.freeze

    # @!attribute data
    #   @return [ Object ] The raw binary data.
    #   @since 2.0.0
    #
    # @!attribute type
    #   @return [ Symbol ] The binary type.
    #   @since 2.0.0
    attr_reader :data, :type

    # Get the BSON single byte type for a binary.
    #
    # @example Get the bson type.
    #   binary.bson_type
    #
    # @return [ String ] 0x05.
    #
    # @see http://bsonspec.org/#/specification
    #
    # @since 2.0.0
    def bson_type
      BSON_TYPE
    end

    # Instantiate the new binary object.
    #
    # @example Instantiate a binary.
    #   BSON::Binary.new(:md5, data)
    #
    # @param [ Symbol ] type The binary type.
    # @param [ Object ] data The raw binary data.
    #
    # @since 2.0.0
    def initialize(data="", subtype=:generic)
      @data = data
      @type = subtype
      puts "subtype is #{subtype} and type is #{type}"
    end

    # Encode the binary type
    #
    # @example Encode the binary.
    #   binary.to_bson
    #
    # @return [ String ] The encoded binary.
    #
    # @see http://bsonspec.org/#/specification
    #
    # @since 2.0.0
    def to_bson
      data.bytesize.to_bson + SUBTYPES.fetch(type) + data
    end

    # Register this type when the module is loaded.
    #
    # @since 2.0.0
    Registry.register(BSON_TYPE, self)
  end
end
