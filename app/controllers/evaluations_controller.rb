class EvaluationsController < BaseCrudController
  def show
    crud_instance_id = params['id']
    crud_instance = crud_model.find_by(id: crud_instance_id)

    _hash = {
      id: crud_instance.id,
      user_id: crud_instance.user_id,
      finished: crud_instance.finished,
      correct_score: crud_instance.correct_score,
      questions: crud_instance.questions
    }

    render json: _hash, status: 200
  end

  def create
    questions_quantity = 80
    
    new_evaluation = nil
    selected_questions = []

    ActiveRecord::Base.transaction do
      new_evaluation = current_user.evaluations.create!(
        expires_at: params[:expires_at],
        finished: params[:finished] || false)
      
      law_area_ids = params[:law_area_ids]

      if  law_area_ids.present?
        law_area_quantity = law_area_ids.size
        questions_per_area = (questions_quantity/law_area_quantity).ceil
        
        law_area_ids.each do |law_area_id|
          area_questions = Question.where(law_area_id: law_area_id)
            .order("RANDOM()")
            .limit(questions_per_area)    
            selected_questions.concat(area_questions)      
      end

      else
          selected_questions = Question.order("RANDOM()")
          .limit(questions_quantity)
      end

      selected_questions.each do |question|
        EvaluationQuestion.create!(
          question_id: question.id,
          evaluation_id: new_evaluation.id)
      end
      
      render json: {id: new_evaluation.id,
      questions: selected_questions.map{|q| {id: q.id, title: q.title, options: [q.option_1, q.option_2, q.option_3, q.option_4, q.option_5]}},
        message: 'Avaliação criada com sucesso.'}
    
      rescue StandardError => e
        render json: {error: "Erro ao criar a avaliação #{e.message}"}, status: :unprocessable_entity
      end
  end
  
  def crud_model
    Evaluation
  end

  def create_params
    params.permit(:expires_at, :finished, law_area_ids: [])
  end

  def answers 
    evaluation = Evaluation.find_by(id: params[:id])

    answers = params[:answers]
    
    answers.each do|answer|
      evaluation_question = EvaluationQuestion.find_by(evaluation_id: evaluation.id, question_id: answer['question_id'])
      evaluation_question.chosen_option = answer['choice']
      evaluation_question.save
      evaluation.validate_question(evaluation_question)
    end

    evaluation.update_score
  
    render json: {
      "follow_up": evaluation.follow_up,
      "questions": {
        "corrects": evaluation.get_questions_answered('T'),
        'incorrects': evaluation.get_questions_answered('F')
      }
    }, status: :ok
  end
end