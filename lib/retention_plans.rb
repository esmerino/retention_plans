# frozen_string_literal: true

require_relative 'retention_plans/version'
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
      retaine = {
        each_snapshot: false,
        last_snapshot_month: false,
        last_snapshot_year: false
      }

      retaine[:each_snapshot] = true if DateTime.now > date.next_day(42)

      retaine
    end

    def gold_rule(date)
      date = DateTime.parse(date)
      retaine = {
        each_snapshot: false,
        last_snapshot_month: false,
        last_snapshot_year: false
      }

      retaine[:each_snapshot] = true if DateTime.now > date.next_day(42)
      retaine[:last_snapshot_month] = true if DateTime.now > date.next_month(12)

      retaine
    end

    def platinum_rule(date)
      date = DateTime.parse(date)
      retaine = {
        each_snapshot: false,
        last_snapshot_month: false,
        last_snapshot_year: false
      }

      retaine[:each_snapshot] = true if DateTime.now > date.next_day(42)
      retaine[:last_snapshot_month] = true if DateTime.now > date.next_month(12)
      retaine[:last_snapshot_year] = true if DateTime.now > date.next_year(7)

      retaine
    end     
  end
end
