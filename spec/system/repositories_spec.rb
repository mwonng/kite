require 'rails_helper'

describe 'repositories', type: :system do
  before do
    types = %w[ruby python java].map do |type|
      RepositoryType.create!(name: type)
    end

    %w[kite drachen pipas].each_with_index do |repo_name, index|
      Repository.create!(name: repo_name, repository_type: types[index])
    end
  end

  it 'lists repositories' do
    visit '/'
    expect(page).to have_content 'kite'
    expect(page).to have_content 'drachen'
    expect(page).to have_content 'pipas'
  end
end
