# frozen_string_literal: true

require_relative "retention_plans/version"
require 'date'

module RetentionPlans
  class Error < StandardError; end

  class << self
    def retaine?(date:, plan:)
      rule_plan(date, plan)
    end

    private

    def rule_plan(date, plan)
     return standard_rule(date) if plan == 'standard'
     return gold_rule(date) if plan == 'gold'
     return platinum_rule(date) if plan == 'platinum'

     raise Error
    end

    def standard_rule(date)
      date = DateTime.parse(date)
      DateTime.now > date.next_day(42)
    end

    def gold_rule(date)
      date = DateTime.parse(date)
      DateTime.now > date.next_day(42).next_month(12)
    end

    def platinum_rule(date)
      date = DateTime.parse(date)
      DateTime.now >  date.next_day(42).next_month(12).next_year(7)
    end
  end
end
