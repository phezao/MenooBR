require 'rails_helper'
RSpec.describe ImportRecipesJob, type: :job do
  it 'enqueues the job' do
    expect do
      VCR.use_cassette('recipes_api_fetcher') do
        ImportRecipesJob.perform_async
      end
    end.to change(ImportRecipesJob.jobs, :size).by(1)
  end
end
