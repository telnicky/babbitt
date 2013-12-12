class Sleep < ActiveRecord::Base
  after_create :publish_heart

  private

  def publish_heart
    data = {
      :end_time => self.end_time.strftime('%Y-%m-%d %H:%M:%S'),
      :start_time => self.start_time.strftime('%Y-%m-%d %H:%M:%S'),
      :index => self.index.to_i
    }

    message = {:channel => '/sleeps/new', :data => data }
    uri = URI.parse("http://codoscopy.com:9292/faye")
    Net::HTTP.post_form(uri, :message => message.to_json)
  end
end
