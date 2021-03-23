# Retention Plans

## Setup the project

```bach
1. $ git clone git@github.com:esmerino/retention_plans.git retention_plans
2. $ cd retention_plans
3. $ rspec
4. $ gem build retention_plans.gemspec
5. $ gem install ./retention_plans-0.1.0.gem
6. $ irb
7. >> require 'retention_plans'
8. >> RetentionPlans.retaine?(date: '20210321113021', plan: 'standard')
```

## The plans and rules for retention

- Standard: 42 days retention
  - We will retain each snapshot daily for 42 days
- Gold: 42 days and 12 months retention
  - We will retain each snapshot daily for 42 days
  - We will retain the last snapshot of the month for 12 months
- Platinum (42 days, 12 months and 7 years)
  - We will retain each snapshot daily for 42 days
  - We will retain the last snapshot of the month for 12 months
  - We will retain the last snapshot of the year for 7 years
