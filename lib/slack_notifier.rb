# frozen_string_literal: true

module SlackNotifier
  def self.ping_errors(e, location = nil)
    client = Slack::Web::Client.new
    attachments = [
      {
        "title":  'Error message',
        "text":   (location.present? ? "URL: #{location}\n" : '') + e&.message,
        "color":  '#FF0000',
        "footer": 'Bellow is full traces',
        "ts":     Time.current.to_i
      }
    ]
    client.chat_postMessage(channel: ENV['ERROR_CHANNEL_SLACK'], as_user: true, attachments: attachments.to_json)
    ping_fulltrace(e)
  end

  def self.ping_fulltrace(e)
    client = Slack::Web::Client.new
    error_trace = Rails.backtrace_cleaner.clean(e.backtrace)
    error_trace = error_trace.join("\n")
    client.chat_postMessage(channel: ENV['ERROR_CHANNEL_SLACK'], as_user: true, text: "```\n" + error_trace + "\n```")
  end
end
