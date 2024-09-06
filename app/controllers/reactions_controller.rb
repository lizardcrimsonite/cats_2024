class ReactionsController < ApplicationController
  def new_user_reaction
    @user = current_user
    @type = params[:reaction_type]
    @kind = params[:kind]
    
    # Encontrar la publicación o el comentario, según corresponda
    @publication = Publication.find(params[:publication_id]) if params[:publication_id]
    @comment = Comment.find(params[:comment_id]) if params[:comment_id]

    # Buscar reacciones existentes
    reaction_publication = Reaction.find_by(user_id: @user.id, publication_id: @publication&.id) if @type == "publication"
    reaction_comment = Reaction.find_by(user_id: @user.id, comment_id: @comment&.id) if @type == "comment"

    respond_to do |format|
      # Verificar si ya existe una reacción
      if reaction_publication || reaction_comment
        format.html { redirect_to publication_path(@publication), notice: 'You already reacted to this publication.' }
      else
        # Crear la reacción según el tipo (publicación o comentario)
        @reaction = if @type == "publication"
                      Reaction.new(user_id: @user.id, publication_id: @publication.id, reaction_type: @type, kind: @kind)
                    else
                      Reaction.new(user_id: @user.id, comment_id: @comment.id, reaction_type: @type, kind: @kind)
                    end

        # Guardar la reacción y manejar el resultado
        if @reaction.save
          format.html { redirect_to publication_path(@publication), notice: 'Reaction was successfully created.' }
        else
          format.html { redirect_to publication_path(@publication), alert: 'Something went wrong.' }
        end
      end
    end
  end
end



        

