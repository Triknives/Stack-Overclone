class QuestionsController < ApplicationController
    before_action :authorize, except: [:index, :show]
    before_action only: [:edit, :update, :destroy] do
        creator_auth(Question.find(params[:id]).user_id)
    end


    def index
        @questions = Question.all
        render :index
    end

    def new
        @question = Question.new
    end
    def create
        @question = Question.new(question_params)
        @question.user_id = session[:user_id]
        if @question.save
            flash[:notice] = 'You\'ve successfully created a question!'
            redirect_to question_path (@question)
        else
            render :new
        end
    end

    def show
        @question = Question.find(params[:id])
        render :show
    end

    def edit
        @question = Question.find(params[:id])
        render :edit
    end
    def update
        @question= Question.find(params[:id])
        if @question.update(question_params)
            redirect_to questions_path
        else
            render :edit
        end
    end
    def destroy
        @question = Question.find(params[:id])
        @question.destroy
        redirect_to questions_path
    end

    private
    def question_params
        params.require(:question).permit(:title, :body, :language, :user_id)
    end
end
