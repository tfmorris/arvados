# Copyright (C) The Arvados Authors. All rights reserved.
#
# SPDX-License-Identifier: AGPL-3.0

class RequestShellAccessReporter < ActionMailer::Base
  default from: Rails.configuration.Mail.EmailFrom
  default to: Rails.configuration.Mail.SupportEmailAddress

  def send_request(user, params)
    @user = user
    @params = params
    subject = "Shell account request from #{user.full_name} (#{user.email}, #{user.uuid})"
    mail(subject: subject)
  end
end
