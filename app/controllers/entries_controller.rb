# frozen_string_literal: true

class EntriesController < ApplicationController
  before_action :set_entry, only: %i[show update destroy]
  before_action :authenticate_request!
  # GET /entries
  def index
    supervisor_id = params[:supervisor_id]
    institution = Institution.find(Supervisor.find(supervisor_id).institution_id)
    all_supervisors = Supervisor.where(institution_id: institution.id).to_a

    matched_entries = []
    all_supervisors.each do |s|
      all_entries = Entry.where(supervisor_id: s.id).order(timestamp: :desc).to_a
      all_entries.each do |e|
        matched_entries.push(e)
      end
    end

    result = []

    matched_entries.each do |e|
      hash = e.as_json
      hash['supervisor_name'] = Supervisor.where(id: e.supervisor_id).take.name

      hash['category_array'] = []
      entrycategories = EntryCategory.where(entry_id: e.id).to_a
      entrycategories.each do |ec|
        matched_category = Category.where(id: ec.category_id).take
        hash['category_array'].push(matched_category)
      end

      hash['client_array'] = []
      cliententries = ClientEntry.where(entry_id: e.id).to_a
      cliententries.each do |ce|
        matched_client = Client.where(id: ce.client_id).take
        hash['client_array'].push(matched_client)
      end
      result.push(hash)
    end

    render json: { entries: result }
  end

  def new
    supervisor_id = params[:supervisor_id]
    timestamp_string = params[:timestamp]
    timestamp = timestamp_string.to_time
    text = params[:text]
    client_array = params[:client_array]
    category_array = params[:category_array]
    entry = Entry.create(timestamp: timestamp, text: text, supervisor_id: supervisor_id)

    client_array = client_array.split(',').map(&:to_i)
    category_array = category_array.split(',').map(&:to_i)

    check_entrycategory = true
    check_cliententry = true

    category_array.each do |c|
      entry_category = EntryCategory.create(entry_id: entry.id, category_id: c)
      check_entrycategory = false unless entry_category.save
    end
    client_array.each do |c|
      client_entry = ClientEntry.create(client_id: c, entry_id: entry.id)
      check_entrycategory = false unless client_entry.save
    end

    if entry.save && check_cliententry && check_entrycategory
      render json: {
        status: 200,
        message: 'Successfully created entry.'
      }.to_json
    else
      render json: {
        status: 400,
        message: 'Something went wrong.'
      }.to_json
    end
  end

  # GET /entries/1
  def show
    render json: @entry
  end

  # PATCH/PUT /entries/1
  def update
    if @entry.update(entry_params)
      render json: @entry
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /entry
  def delete
    entry_id = params[:entry_id]
    entry = Entry.destroy(entry_id)
    if entry.destroyed?
      render json: {
        status: 200,
        message: 'Successfully destroyed entry.'
      }.to_json
    else
      render json: {
        status: 400,
        message: 'Something went wrong.'
      }.to_json
    end
  end

  def destroy
    @entry = Entry.destroy(params[:id])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entry
    @entry = Entry.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def entry_params
    params.require(:entry).permit(:timestamp, :text, :supervisor_id)
  end
end
