require 'test_helper'
require 'action_view'
require 'action_view/helpers/sanitize_helper'

class DeprecatedSanitizerTest < ActiveSupport::TestCase
  def sanitize_helper
    ActionView::Helpers::SanitizeHelper
  end

  test 'Action View sanitizer vendor is set to deprecated sanitizer' do
    assert_equal Rails::DeprecatedSanitizer, sanitize_helper.sanitizer_vendor
  end

  test 'Action View sanitizer vendor returns constant from HTML module' do
    assert_equal HTML::LinkSanitizer, sanitize_helper.sanitizer_vendor.link_sanitizer
  end

  test 'setting allowed tags modifies HTML::WhiteListSanitizers allowed tags' do
    sanitize_helper.sanitized_allowed_tags = %w(horse)
    assert_equal %w(horse), HTML::WhiteListSanitizer.allowed_tags
  end
end