# Validates a company number.
#   Valid numbers are:
#     - two characters and 6 digits
#     - 8 digits
#
# A company number consists of eight digits.
# The first of these digits is usually a zero and because of this, in most cases only
# the last seven numbers are usually required to be noted.
# The certificate of incorporation of a new company will show only
# the last seven numbers although the company number is actually eight digits and has a leading zero which is omitted.
#
module Ea
  module Validation
    class CompaniesHouseNumberValidator < ActiveModel::EachValidator

      VALID_COMPANIES_HOUSE_REGISTRATION_NUMBER_REGEX = Regexp.new(/\A(\d{8,8}$)|([a-zA-Z]{2}\d{6}$)\z/i).freeze

      def validate_each(record, attribute, value)
        value.strip!

        record.errors.add(
          attribute,
          options[:message] || I18n.t("ea.validation.errors.companies_house_number.invalid_html")
        ) unless value =~ VALID_COMPANIES_HOUSE_REGISTRATION_NUMBER_REGEX
      end
    end

  end
end
