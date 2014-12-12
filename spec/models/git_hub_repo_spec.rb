require 'rails_helper'

RSpec.describe GitHubRepo, :type => :model do
    before do
      @lang_c = FactoryGirl.create(:programming_language, :name => "C")
      @lang_perl = FactoryGirl.create(:programming_language, :name => "Perl")
    end
    describe "New repo" do
        describe "#retrieve_from_hash" do
            it "##Empty hash" do
                repo = GitHubRepo.new(:name => "T1")
                repo.retrieve_from_hash(Hash.new)
                expect(repo.name).to eq "T1"
                expect(repo.repo_languages).to eq []
            end
            it "##One new language" do
                repo = GitHubRepo.new(:name => "T1")
                repo.retrieve_from_hash({:languages=>{"C++" => 10}, :num_commits => 50, :strange_input=>"bamm"})
                new_lang = FactoryGirl.build(:programming_language, :name => "C++")
                
                #new_lang_repo = FactoryGirl.build(:repo_language, :programming_language => new_lang, :git_hub_repo => repo)
                expect(repo.name).to eq "T1"
                expect(repo.num_commits).to eq 50
                expect(repo.repo_languages.length).to eq 1
                expect(repo.repo_languages.first.programming_language.name).to eq new_lang.name
                expect(repo.repo_languages.first.number_lines).to eq 10
            end
            it "##Multiple new language" do
                repo = GitHubRepo.new(:name => "T1")
                repo.retrieve_from_hash({:languages=>{"C++" => 10, "Scala" => 6}})
                cpp_lang = FactoryGirl.build(:programming_language, :name => "C++")
                scala_lang = FactoryGirl.build(:programming_language, :name => "Scala")
                
                expect(repo.name).to eq "T1"
                expect(repo.repo_languages.length).to eq 2
                expect(repo.repo_languages.first.programming_language.name).to eq cpp_lang.name
                expect(repo.repo_languages.first.number_lines).to eq 10
                expect(repo.repo_languages.second.programming_language.name).to eq scala_lang.name
                expect(repo.repo_languages.second.number_lines).to eq 6
            end
            it "##One new and one existing language" do
                repo = GitHubRepo.new(:name => "T1")
                repo.retrieve_from_hash({:languages=>{"C++" => 10, "Perl" => 6}})
                repo.save
                cpp_lang = FactoryGirl.build(:programming_language, :name => "C++")
                
                expect(repo.name).to eq "T1"
                expect(repo.repo_languages.length).to eq 2
                expect(ProgrammingLanguage.all.length).to eq 3
                expect(repo.repo_languages.first.programming_language.name).to eq cpp_lang.name
                expect(repo.repo_languages.first.number_lines).to eq 10
                expect(repo.repo_languages.second.programming_language.name).to eq @lang_perl.name
                expect(repo.repo_languages.second.number_lines).to eq 6
            end
            it "##Run twice" do
                repo = GitHubRepo.new(:name => "T1")
                repo.retrieve_from_hash({:languages=>{"C++" => 10}})
                repo.save
                repo.retrieve_from_hash({:languages=>{"Perl" => 5}})
                repo.save
                cpp_lang = FactoryGirl.build(:programming_language, :name => "C++")
                
                expect(repo.name).to eq "T1"
                expect(repo.repo_languages.length).to eq 1
                expect(ProgrammingLanguage.all.length).to eq 3
                expect(repo.repo_languages.first.programming_language.name).to eq @lang_perl.name
                expect(repo.repo_languages.first.number_lines).to eq 5
            end
            it "##Real example" do
                repo = GitHubRepo.new(:name => "T1")
                repo.retrieve_from_hash({:languages=>{:"C++"=>446519, :Shell=>134, :Perl=>330, 
                                                      :JavaScript=>20351, :Ruby=>58608, :CoffeeScript=>844, 
                                                      :CSS=>1860, :PHP=>20984, :Python=>1423}, 
                                         :num_commits=>30, 
                                         :last_commit=>Time.parse('2014-10-15 19:02:06 UTC')})
                repo.save
                cpp_lang = FactoryGirl.build(:programming_language, :name => "C++")
                shell_lang = FactoryGirl.build(:programming_language, :name => "Shell")
                perl_lang = FactoryGirl.build(:programming_language, :name => "Perl")
                javascript_lang = FactoryGirl.build(:programming_language, :name => "JavaScript")
                ruby_lang = FactoryGirl.build(:programming_language, :name => "Ruby")
                coffeescript_lang = FactoryGirl.build(:programming_language, :name => "CoffeeScript")
                css_lang = FactoryGirl.build(:programming_language, :name => "CSS")
                php_lang = FactoryGirl.build(:programming_language, :name => "PHP")
                python_lang = FactoryGirl.build(:programming_language, :name => "Python")
                
                expect(repo.name).to eq "T1"
                expect(repo.repo_languages.length).to eq 9
                expect(repo.repo_languages.first.programming_language.name).to eq cpp_lang.name
                expect(repo.repo_languages.first.number_lines).to eq 446519
                expect(repo.num_commits).to eq 30
                expect(repo.last_commit).to eq Time.parse('2014-10-15 19:02:06 UTC')
            end
        end
    end
end
