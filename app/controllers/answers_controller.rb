class AnswersController < ApplicationController
    # This file was generated with the command:
    # rails g controller answers --skip-template-engine
    # The skip-template-engine option just skips
    # generated a folder 'views/answers'
    def create 
        @question = Question.find(params[:question_id])
        @answer = Answer.new answer_params
        @answer.question = @question
        if @answer.save
            redirect_to question_path(@question)
        else
            # For the list of answers
            @answers = @question.answers.order(created_at: :desc)
            render 'questions/show'
        end
    end

    def destroy 
        @answer = Answer.find params[:id]
        @answer.destroy 
        redirect_to question_path(@answer.question)
    end


    private 
    
    def answer_params 
        params.require(:answer).permit(:body)
    end
end
