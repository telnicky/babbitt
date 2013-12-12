require 'hierarchical'

class Step < ActiveRecord::Base
  include ::Hierarchical
  after_create :publish_step

  private

  def publish_step
    data = {
      :end_time => self.end_time.strftime('%Y-%m-%d %H:%M:%S'),
      :start_time => self.start_time.strftime('%Y-%m-%d %H:%M:%S'),
      :amount => self.amount
    }
    message = {:channel => '/steps/new', :data => data }
    uri = URI.parse("http://codoscopy.com:9292/faye")
    Net::HTTP.post_form(uri, :message => message.to_json)
  end
end
