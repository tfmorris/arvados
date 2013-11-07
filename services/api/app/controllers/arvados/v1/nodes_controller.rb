class Arvados::V1::NodesController < ApplicationController
  skip_before_filter :require_auth_scope_all, :only => :ping

  def create
    @object = Node.new
    @object.save!
    @object.start!(lambda { |h| arvados_v1_ping_node_url(h) })
    show
  end

  def self._ping_requires_parameters
    { ping_secret: true }
  end
  def ping
    @object.ping({ ip: params[:local_ipv4] || request.env['REMOTE_ADDR'],
                   ping_secret: params[:ping_secret],
                   ec2_instance_id: params[:instance_id] })
    show
  end

  def index
    if current_user.andand.is_admin
      super
    else
      @objects = model_class.where('last_ping_at >= ?', Time.now - 1.hours)
      render_list
    end
  end
end
