class BaseCrudController < ApplicationController
  def index
    crud_instances = crud_model.all
    render json: crud_instances, status: 200
  end

  def create
    new_crud_instance = crud_model.create(create_params)
      
    if new_crud_instance.errors.present?
      render json: new_crud_instance.errors.messages, status: 422
    else
      render json: new_crud_instance, status: 200
    end
  end

  def show
    crud_instance_id = params['id']
    crud_instance = crud_model.find_by(id: crud_instance_id)
    render json: crud_instance, status: 200
  end

  def update
    crud_instance_id = params['id']
    new_name = params['name']
    crud_instance = crud_model.find_by(id: crud_instance_id)
    if crud_instance.present?
      crud_instance.update(name: new_name)
      render json: crud_instance, status: 200
    else
      render json: {message: 'erro'}, status: 422
    end
  end

  def destroy
    crud_instance_id = params['id']
    crud_instance = crud_model.find_by(id: crud_instance_id)
    if crud_instance.present? 
      crud_instance.delete
      render json: crud_instance, status: 200
    else
      render json: {}, status: 422
    end
  end

  def crud_model
    nil
  end

  def create_params
    nil
  end
end
