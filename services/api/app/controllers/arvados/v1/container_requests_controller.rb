# Copyright (C) The Arvados Authors. All rights reserved.
#
# SPDX-License-Identifier: AGPL-3.0

class Arvados::V1::ContainerRequestsController < ApplicationController
  accept_attribute_as_json :environment, Hash
  accept_attribute_as_json :mounts, Hash
  accept_attribute_as_json :runtime_constraints, Hash
  accept_attribute_as_json :command, Array
  accept_attribute_as_json :filters, Array
  accept_attribute_as_json :scheduling_parameters, Hash
  accept_attribute_as_json :secret_mounts, Hash

  def self._index_requires_parameters
    (super rescue {}).
      merge({
        include_trash: {
          type: 'boolean', required: false, description: "Include container requests whose owner project is trashed."
        },
      })
  end

  def self._show_requires_parameters
    (super rescue {}).
      merge({
        include_trash: {
          type: 'boolean', required: false, description: "Show container request even if its owner project is trashed."
        },
      })
  end
end
