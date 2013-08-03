class TicketsController < ApplicationController
  before_filter :find_project
  before_filter :find_ticket, :only => [:show, :edit, :update, :destroy]

  def new
    @ticket = @project.tickets.build
  end

  def create
    @ticket = @project.tickets.build(params[:ticket])
    if @ticket.save
      flash[:notice] = "Ticket has been created."
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket has not been created."
      render :action => "new"
    end
  end

  def show
    # nothing to show, is already loaded on before_filter
  end

  def edit
   # nothing to show is already loaded on before_filter
  end

  private
    def find_project
      @project = Project.find(params[:project_id]) # here we don't use just the :id because it the project_id we're looking for.
    end

    def find_ticket
      @ticket = @project.tickets.find(params[:id])
    end

end
