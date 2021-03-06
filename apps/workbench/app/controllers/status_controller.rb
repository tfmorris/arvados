# Copyright (C) The Arvados Authors. All rights reserved.
#
# SPDX-License-Identifier: AGPL-3.0

require "app_version"

class StatusController < ApplicationController
  skip_around_action :require_thread_api_token
  skip_before_action :find_object_by_uuid
  def status
    # Allow non-credentialed cross-origin requests
    headers['Access-Control-Allow-Origin'] = '*'
    resp = {
      apiBaseURL: arvados_api_client.arvados_v1_base.sub(%r{/arvados/v\d+.*}, '/'),
      version: AppVersion.hash,
    }
    render json: resp
  end
end
