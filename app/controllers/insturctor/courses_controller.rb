class Insturctor::CoursesController < ApplicationController
    before_action :authenticate_user!
  
    def new
        @course = Course.new
    end

    def create 
        @course = current_user.courses.create(course_params)
        if @course.valid?
            redirect_to instructor_course_path(@course)
        else
            render :new, status: :unprocessable_entity
    end

    def show
        @course = Couse.find(params[:id])
    end

    private

    def course_params
        params.require(:course).permit(:title, :description, :cost)
    end

end