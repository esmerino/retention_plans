# frozen_string_literal: true

RSpec.describe RetentionPlans do
  it 'has a version number' do
    expect(RetentionPlans::VERSION).not_to be nil
  end

  describe '#retaine?' do
    before do
      allow(DateTime).to receive(:now).and_return(current_date)
    end

    context 'when standard plan' do
      let(:plan) { 'standard' }

      context 'when retaine true' do
        let(:current_date) { DateTime.parse('20210321113021').next_day(42) }

        it do
          date = '20210320113021'
          expect(described_class.retaine?(date: date, plan: plan)).to be_truthy
        end
      end

      context 'when retaine false' do
        let(:current_date) { DateTime.parse('20210321113021') }

        it do
          date = '20210322113021'
          expect(described_class.retaine?(date: date, plan: plan)).to be_falsy
        end
      end
    end

    context 'when gold plan' do
      let(:plan) { 'gold' }

      context 'when retaine true' do
        let(:current_date) do
          DateTime.parse('20210321113021')
                  .next_day(42)
                  .next_month(12)
        end

        it do
          date = DateTime.parse('20210320113021').strftime('%Y%m%d%H%M%S')

          expect(described_class.retaine?(date: date, plan: plan)).to be_truthy
        end
      end

      context 'when retaine false' do
        let(:current_date) do
          DateTime.parse('20210321113021')
                  .next_day(42)
                  .next_month(12)
        end

        it do
          date = DateTime.parse('20210320113021')
                         .next_day(43)
                         .next_month(13)
                         .strftime('%Y%m%d%H%M%S')

          expect(described_class.retaine?(date: date, plan: plan)).to be_falsy
        end
      end
    end

    context 'when platinum plan' do
      let(:plan) { 'platinum' }

      context 'when retaine true' do
        let(:current_date) do
          DateTime.parse('20210321113021')
                  .next_day(42)
                  .next_month(12)
                  .next_year(8)
        end

        it do
          date = DateTime.parse('20210320113021').strftime('%Y%m%d%H%M%S')

          expect(described_class.retaine?(date: date, plan: plan)).to be_truthy
        end
      end

      context 'when retaine false' do
        let(:current_date) do
          DateTime.parse('20210321113021')
                  .next_day(42)
                  .next_month(12)
                  .next_year(7)
        end

        it do
          date = DateTime.parse('20210320113021')
                         .next_day(42)
                         .next_month(11)
                         .next_year(6)
                         .strftime('%Y%m%d%H%M%S')

          expect(described_class.retaine?(date: date, plan: plan)).to be_falsy
        end
      end
    end
  end
end
