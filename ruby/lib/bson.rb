# encoding: utf-8
require "bson/version"
require "bson/registry"
require "bson/element"
require "bson/document"
require "bson/types"
require "bson/ext"

# The core namespace for all BSON related behaviour.
#
# @since 0.0.0
module BSON

  # Constant for bson types that don't actually serialize a value.
  #
  # @since 2.0.0
  NO_VALUE = "".freeze

  # Constant for a null byte (0x00).
  #
  # @since 2.0.0
  NULL_BYTE = 0.chr.freeze
end
