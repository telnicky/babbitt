require 'hierarchical'

class Heart < ActiveRecord::Base
  include ::Hierarchical
  after_create :publish_heart

  private

  def publish_heart
    data = {
      :end_time => self.end_time.strftime('%Y-%m-%d %H:%M:%S'),
      :start_time => self.start_time.strftime('%Y-%m-%d %H:%M:%S'),
      :bpm => self.bpm,
      :so2_sat => self.so2_sat
    }

    message = {:channel => '/hearts/new', :data => data }
    uri = URI.parse("http://codoscopy:9292/faye")
    Net::HTTP.post_form(uri, :message => message.to_json)
  end
end
