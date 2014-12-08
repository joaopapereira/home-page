class WelcomeController < ApplicationController
  def index
  end

  def about
  end

  def portofolio
  end
  
  def skill_level
    @json_data = [
                    ['C/C++', 5],
                    ['Python', 5],
                    ['Telecommunications', 4],
                    ['Linux', 5],
                    ['Network Protocols', 4],
                    ['PL/SQL', 4],
                    ['Java', 3],
                    ['PERL', 1],
                    ['PHP', 2],
                    ['Database', 4]]
    @json_data = @json_data.sort_by {|skill_level| skill_level[0]}
    respond_to do |format|
      format.js { render :json => @json_data }
    end
  end
end
