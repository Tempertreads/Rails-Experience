class ResponsesController < ApplicationController

  http_basic_authenticate_with name: "user", password: "test",
                               only: :destroy

  def create
    # each response has to keep track of which Note the response is attached to
    @note = Note.find(params[:note_id])
    #@note.responses.create creates, saves and automatically links the response to the note
    @response = @note.responses.create(response_params)
    #goes back to show page
    redirect_to note_path(@note)
  end

  def destroy
    #finds article we're looking at, then the response id, then destroys it
    @note = Note.find(params[:note_id])
    @response = @note.responses.find(params[:id])
    @response.destroy
    redirect_to note_path(@note)
  end

  private
    def response_params
      params.require(:response).permit(:responder, :body)
    end

end
