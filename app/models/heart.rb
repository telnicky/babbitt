require 'hierarchical'

class Heart < ActiveRecord::Base
  include ::Hierarchical
  after_create :publish_heart

  private

  def publish_heart
    data = {
      :end_time => self.end_time.strftime('%Y-%m-%d %H:%M:%S'),
      :start_time => self.start_time.strftime('%Y-%m-%d %H:%M:%S'),
      :bpm => self.bpm.to_i,
      :so2_sat => self.so2_sat.to_i,
      :stress_level => self.stress_level.to_i
    }

    message = {:channel => '/hearts/new', :data => data }
    uri = URI.parse("http://codoscopy.com:9292/faye")
    Net::HTTP.post_form(uri, :message => message.to_json)
  end
end
