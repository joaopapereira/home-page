require 'rails_helper'

RSpec.describe GitHubInfo, :type => :model do
  describe "Stats still not fetched today" do
    before do
      @info = FactoryGirl.build(:git_hub_info, :last_update => Date.today - 1.day)
      @repo1 = FactoryGirl.build(:git_hub_repo, :name => "Repo1")
      @repo2 = FactoryGirl.build(:git_hub_repo, :name => "Repo2")
      @repo3 = FactoryGirl.build(:git_hub_repo, :name => "Repo3")
    end
    let(:hub_info) do
      mock_model GitHubInfo, :last_update => Date.today - 1.day
    end
    it "#Check fetch" do
      values = { 
          "Repo1" => {"c++" => 1000, "perl" => 200},
          "Repo2" => {"perl" => 300, "python" => 10},
          "Repo3" => {"C" => 500, "perl" => 10},
      }
      expect(@info).to receive(:retrieve_from_github).exactly(:once) {values}
      repos = @info.load_repos
      expect(repos.length).to be 3
      repos.each do |repo|
        expect([@repo1.name, @repo2.name, @repo3.name]).to include repo.name
      end
    end
  end
  describe "Stats fetch today already" do
    before do
      @info = FactoryGirl.build(:git_hub_info, :last_update => Date.today)
      @repo1 = FactoryGirl.create(:git_hub_repo, :name => "T1", :num_commits => 1, :last_commit => Date.today - 1.day)
      @repo2 = FactoryGirl.create(:git_hub_repo, :name => "T2", :num_commits => 1, :last_commit => Date.today - 1.day)
      @repo1.save
      @repo2.save
    end
    it "#Check data not fetched" do
      expect( @info).to receive(:retrieve_from_github).exactly(0).times
      @info.load_repos
    end
    it "#Correct data retrieved from database" do
        expect(@info.load_repos.length).to be 2
        @info.load_repos.each do |repo|
            expect([@repo1, @repo2]).to include repo
        end
    end
  end
  describe "Lines from repos" do
    before do
      @info = FactoryGirl.build(:git_hub_info, :last_update => Date.today-1)
    end
    it "#retrieve correctly all lines" do
      values = { 
          "Repo1" => {"c++" => 1000, "perl" => 200},
          "Repo2" => {"perl" => 300, "python" => 10},
          "Repo3" => {"C" => 500, "perl" => 10},
      }
      expect(@info).to receive(:retrieve_from_github).exactly(:once) {values}
      all_lines = @info.all_languages_lines
      expected_value = {"c++"=>1000, "perl" => 510, "python" => 10, "C" => 500}
      #expect(all_lines).to eq expected_value
    end
  end
end
