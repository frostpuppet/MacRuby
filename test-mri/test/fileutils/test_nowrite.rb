# $Id: test_nowrite.rb 31404 2011-05-01 09:37:17Z yugui $

require 'fileutils'
require 'test/unit'
require_relative 'clobber'

class TestFileUtilsNoWrite < Test::Unit::TestCase

  include FileUtils::NoWrite
  include TestFileUtils::Clobber

  def test_visibility
    FileUtils::METHODS.each do |m|
      assert_equal true, FileUtils::NoWrite.respond_to?(m, true),
                   "FileUtils::NoWrite.#{m} is not defined"
      assert_equal true, FileUtils::NoWrite.respond_to?(m, false),
                   "FileUtils::NoWrite.#{m} is not public"
    end
    FileUtils::METHODS.each do |m|
      assert_equal true, respond_to?(m, true),
                   "FileUtils::NoWrite\##{m} is not defined"
      assert_equal true, FileUtils::NoWrite.private_method_defined?(m),
                   "FileUtils::NoWrite\##{m} is not private"
    end
  end
end
