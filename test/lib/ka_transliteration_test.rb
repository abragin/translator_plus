require "test_helper"

class KaTransliterationTest < ActiveSupport::TestCase
  include KaTransliteration
  test "#transliterate" do
    assert_equal "ჭჩც ლ", transliterate("ch'chc L")
  end

end
