class NoticesController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:create]

  def create

    notice_params = params.to_hash
    notice_params["_errors"] = notice_params.delete("errors")

    Notice.create notice_params.reject { |key,value| !%W{ _errors context environment session params notifier key project_id notice }.include?(key) }
    return render text: 'Saved', status: 200
  end

end
