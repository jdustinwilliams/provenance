class ProvenanceRecordsController < ApplicationController
  http_basic_authenticate_with name: "username", password: "changeme"
  before_action :set_provenance_record, only: %i[ show edit update destroy ]
  before_action :persist_params

  # GET /provenance_records or /provenance_records.json
  def index
    session[:show_unlisted] = params[:show_unlisted] if params[:show_unlisted].present?
    session[:column] = params[:column] if params[:column].present?
    session[:direction] = params[:direction] if params[:direction].present?
    session[:q] = params[:q] if params[:q].present?

    session[:column] = "accession_number" if !session[:column].present?
    session[:direction] = "asc" if !session[:direction].present?
    
    @provenance_records = ProvenanceRecord.all
    @provenance_records = ProvenanceRecord.where('collection_name like ? ', "%#{session[:q]}%") if session[:q].present?
    
    if (!session[:show_unlisted] || session[:show_unlisted] == "false")
      @provenance_records = @provenance_records.where(unlist: false)
    end

    if (session[:column])
      @provenance_records = @provenance_records.order("#{session[:column]} #{session[:direction]}")
    end

    if (session[:column] == "accession_number")
      @provenance_records = @provenance_records.sort_by{|p| p.accession_number.to_i}
      if session[:direction] == "desc"
        @provenance_records = @provenance_records.reverse
      end
    end
  end

  # GET /provenance_records/1 or /provenance_records/1.json
  def show
  end

  # GET /provenance_records/new
  def new
    @provenance_record = ProvenanceRecord.new
  end

  # GET /provenance_records/1/edit
  def edit
  end

  # Based on: https://gorails.com/forum/how-do-i-create-a-delete-button-for-images-uploaded-with-active-storage
  def delete_file_attachment
    @file = ActiveStorage::Attachment.find(params[:id])
    @file.purge
    redirect_back(fallback_location: request.referer)
  end

  def clear_settings
    session[:show_unlisted] = nil
    session[:column] = nil
    session[:direction] = nil
    session[:q] = nil

    redirect_to :provenance_records
  end

  # POST /provenance_records or /provenance_records.json
  def create
    @provenance_record = ProvenanceRecord.new(provenance_record_params)

    respond_to do |format|
      if @provenance_record.save
        format.html { redirect_to provenance_record_url(@provenance_record), notice: "Provenance record was successfully created." }
        format.json { render :show, status: :created, location: @provenance_record }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @provenance_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /provenance_records/1 or /provenance_records/1.json
  def update
    respond_to do |format|
      if @provenance_record.update(provenance_record_params)
        format.html { redirect_to provenance_record_url(@provenance_record), notice: "Provenance record was successfully updated." }
        format.json { render :show, status: :ok, location: @provenance_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @provenance_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /provenance_records/1 or /provenance_records/1.json
  def destroy
    @provenance_record.destroy

    respond_to do |format|
      format.html { redirect_to provenance_records_url, notice: "Provenance record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def confirm_destroy
    @provenance_record = ProvenanceRecord.find(params[:provenance_record_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provenance_record
      @provenance_record = ProvenanceRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def provenance_record_params
      params.require(:provenance_record).permit(:accession_number, :collection_name, :collection_name_alpha, :start_year, :end_year, :date_expression, :year_received, :month_received, :day_received, :linear_feet, :containers, :finding_aid_link, :unlist, :provenance_files => [])
    end

    def persist_params
      session[:column] ||= params[:column]
      session[:direction] ||= params[:direction]
      session[:show_unlisted] ||= params[:show_unlisted]
      session[:q] ||= params[:q]
    end
end
