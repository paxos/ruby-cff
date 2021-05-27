require 'test_helper'

class CFFApaFormatterTest < Minitest::Test
  include ::CFF::Util

  Dir[::File.join(FILES_DIR, '*')].each do |input_file|
    define_method("test_converter_for_#{File.basename(input_file)}") do
      cff = ::CFF::File.read(input_file)
      output_file = ::File.join(CONVERTED_APALIKE_DIR, File.basename(input_file))

      assert_equal File.read(output_file), cff.to_apalike
    end
  end

  def test_can_tolerate_invalid_file
    cff = CFF::Model.new(nil)
    assert_nil cff.to_apalike
  end
end
