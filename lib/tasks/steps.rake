
namespace :db do
  desc "Generates random step data"
  task :seed_steps => :environment do
    days = ENV['DAYS'].presence || 7
    first_day = DateTime.now.beginning_of_day - days.days
    days.times do | d | 
      puts "Day #{ d }"
      24.times do | hr |
        60.times do | min |
          Step.create(:start_time => (first_day + d.day + hr.hour + min.minute),
                      :end_time => (first_day + d.day + hr.hour + min.minute + 1.minute),
                      :amount => Random.rand(0...120))
        end
      end
    end
  end
end
