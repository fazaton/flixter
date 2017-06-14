class LessonsController < ApplicationController
    before_action :authenticate_user!
    before_action :require_enrolled_for_current_lesson, only: [:show]
    
    def show
    end
    
    private
    
    helper_method :current_lesson
    def current_lesson
       @current_lesson ||= Lesson.find(params[:id])
    end
    
    
    def require_enrolled_for_current_lesson
        if current_user.enrolled_in?(@current_user)
            redirect_to courses_path, alert: 'You are not enrolled into the course!'
        end
    end
end
