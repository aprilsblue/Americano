class Yeahap < ApplicationRecord
  belongs_to :user
  belongs_to :page
  belongs_to :yeahapbox

  scope :public_true, -> { where(is_public: 1) }
  scope :public_false, -> { where(is_public: 0) }

  after_create :webhook

  def webhook
    if Yeahap.all.count%10 == 0
      @yeahap = Yeahap.last
      text="#{Yeahap.count}번째 예압이 만들어졌습니다. by #{@yeahap.user.email}"
      notify_slack(text)
    end
  end

  def notify_slack(text)
    webhook_url = ENV["SLACK_WEBHOOK_URL"]
    payload = {
      :channel  => "#notice",
      :username => "Yeahap-bot",
      :text     => text,
    }.to_json
    cmd = "curl -X POST --data-urlencode 'payload=#{payload}' #{webhook_url}"
    system(cmd)
  end
end
