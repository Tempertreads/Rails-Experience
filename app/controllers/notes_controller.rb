class NotesController < ApplicationController
  http_basic_authenticate_with name: "user", password: "test",
                               except: [:index, :show]

  def index
    @notes = Note.all
  end

  def show
    # uses Note.find to find the article we're interested in, perams[:id] gets the id parameter from the table which is at the beginning of each entry
    @note = Note.find(params[:id])
  end

  def new
    # creates a new instance of the variable Note, this is so article has a value in the view
    @note = Note.new
  end

  def edit
    # uses Note.find to find the article we're interested in, perams[:id] gets the id parameter from the table which is at the beginning of each entry
    @note = Note.find(params[:id])
  end

  def create
    # creates an instance variable of the Note model and initializes it with it's attributes
    @note = Note.new(note_params)
    # @note.save saves the model in the database, if it's successful it goes to the show page, otherwise it reloads the page
    if @note.save
      redirect_to @note
    else
      render 'new'
    end
  end

  def update
    # creates an instance variable of the Note model and initializes it with it's attributes
    @note = Note.find(params[:id])
    #note.update updates the record in the database, if it's successful it goes to the show page, otherwise it reloads the edit page
    if @note.update(note_params)
      redirect_to @note
    else
      render 'edit'
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    redirect_to notes_path
  end
  private
  # a method use to restrict what can actions can change :title and :text variables in the note model
  def note_params
    params.require(:note).permit(:title, :text)
  end
end
