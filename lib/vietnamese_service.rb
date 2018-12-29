# frozen_string_literal: true

module VietnameseService
  VIETNAMESE_CONVERT_TABLE = {
    'a' => %w[à á ạ ả ã â ầ ấ ậ ẩ ẫ ă ằ ắ ặ ẳ ẵ],
    'e' => %w[è é ẹ ẻ ẽ ê ề ế ệ ể ễ],
    'i' => %w[ì í ị ỉ ĩ],
    'o' => %w[ò ó ọ ỏ õ ô ồ ố ộ ổ ỗ ơ ờ ớ ợ ở ỡ],
    'u' => %w[ù ú ụ ủ ũ ư ừ ứ ự ử ữ],
    'y' => %w[ỳ ý ỵ ỷ ỹ],
    'd' => ['đ'],
    'A' => %w[À Á Ạ Ả Ã Â Ầ Ấ Ậ Ẩ Ẫ Ă Ằ Ắ Ặ Ẳ Ẵ],
    'E' => %w[È É Ẹ Ẻ Ẽ Ê Ề Ế Ệ Ể Ễ],
    'I' => %w[Ì Í Ị Ỉ Ĩ],
    'O' => %w[Ò Ó Ọ Ỏ Õ Ô Ồ Ố Ộ Ổ Ỗ Ơ Ờ Ớ Ợ Ở Ỡ],
    'U' => %w[Ù Ú Ụ Ủ Ũ Ư Ừ Ứ Ự Ử Ữ],
    'Y' => %w[Ỳ Ý Ỵ Ỷ Ỹ],
    'D' => ['Đ']
  }.freeze

  def normalize_strip_space(string)
    ret = replace_with_alphabet(string).gsub(/\W/, '')
    ret.blank? ? nil : ret
  rescue StandardError
    nil
  end

  def normalize_with_hyphen(string)
    ret = replace_with_alphabet(string).gsub(/\s*-\s*/, ' ').gsub(/\W/, '-')

    # incase we have special character at first and last, it looks stupid
    ret[0] = '' if ret[0] == '-'
    ret[-1] = '' if ret[-1] == '-'

    ret.blank? ? nil : ret
  rescue StandardError
    nil
  end

  def replace_with_alphabet(string)
    normalize_string = string.dup
    mapping_table = {}

    VIETNAMESE_CONVERT_TABLE.each { |k, v| v.each { |char| mapping_table[char] = k}}
    mapping_table.each { |origin_char, normalize_char| normalize_string.gsub!(origin_char, normalize_char)}
    normalize_string.downcase
  end
end
