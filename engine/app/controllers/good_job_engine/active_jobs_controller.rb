module GoodJobEngine
  class ActiveJobsController < GoodJobEngine::BaseController
    def show
      @jobs = GoodJob::Job.where("serialized_params ->> 'job_id' = ?", params[:id])
                          .order(Arel.sql("COALESCE(scheduled_at, created_at) DESC"))
    end
  end
end