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

  def self.followee_yeahaps(current_user_id)
    recent = []
    recent_count = 5

    all.where(is_public: 1).reverse.each do |y|
      if recent.count < recent_count
        if !User.find(current_user_id).yeahaps.where(page_id: y.page_id).present?
          User.find(current_user_id).followees.all.each do |f|
            if y.user_id == f.id
              recent << y
            end
          end
        end
      else
        break
      end
    end

    return recent
  end
end
