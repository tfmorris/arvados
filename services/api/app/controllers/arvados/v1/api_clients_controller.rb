# Copyright (C) The Arvados Authors. All rights reserved.
#
# SPDX-License-Identifier: AGPL-3.0

class Arvados::V1::ApiClientsController < ApplicationController
  before_filter :admin_required
end
