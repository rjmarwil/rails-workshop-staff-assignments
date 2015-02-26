class PeopleController < ApplicationController

  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(params.require(:person).permit(:first_name, :last_name, :title))
    if @person.save
      redirect_to root_path, notice: "Person was created!"
    else
      render :new
    end
  end

  def show
    @person = Person.find(params[:id])
  end

  def edit
    @person = Person.find(params[:id])
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    redirect_to people_path, notice: 'Person was successfully destroyed.'
  end

  def update
    if @person.update(person_params)
      redirect_to people_path, notice: 'Person was successfully updated.'
    else
      render :edit
    end
  end

  private

  def person_params
    params.require(:person).permit(:title, :first_name, :last_name)
  end

end
