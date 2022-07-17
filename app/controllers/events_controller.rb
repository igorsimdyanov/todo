# frozen_string_literal: true

class EventsController < ApplicationController
  include Commentable

  before_action :set_event, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /events or /events.json
  def index
    @events = policy_scope(Event)
              .includes(:items)
              .page(params[:page])
              .per(Settings.pager.per_page)
  end

  # GET /events/1 or /events/1.json
  def show
    authorize @event
    @comments = @event.comments&.root&.self_and_descendants&.order(:lft)
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    authorize @event
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params.merge(user: current_user))

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    authorize @event
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    authorize @event
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.with_attached_files.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:name, :content, :done, :finished_at, :user, files: [])
  end
end
