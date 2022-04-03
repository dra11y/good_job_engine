# frozen_string_literal: true
module GoodJobEngine
  class ProcessesController < GoodJobEngine::BaseController
    def index
      @processes = GoodJob::Process.active.order(created_at: :desc) if GoodJob::Process.migrated?
    end
  end
end
