class GitHubRepo < ActiveRecord::Base
     has_many :repo_languages
     has_many :programming_languages, through: :repo_languages
     def retrieve_from_hash repo_stats
          return if repo_stats.length == 0
          repo_stats.each_pair do |key, values|
               if :languages == key then
                    repo_languages.delete_all
                    values.each_pair do |language_name, number_lines|
                         language = ProgrammingLanguage.find_by_name language_name.to_s
                         language = ProgrammingLanguage.new :name => language_name.to_s if language == nil
                         lang_metric = RepoLanguage.new 
                         lang_metric.programming_language = language
                         lang_metric.number_lines = number_lines
                         repo_languages << lang_metric
                    end
               else 
                    send("#{key}=",values) if has_attribute? key
               end
          end
     end
     def languages_to_json
     end
end
