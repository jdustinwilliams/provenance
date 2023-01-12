class ProvenanceRecordsController < ApplicationController
  before_action :set_provenance_record, only: %i[ show edit update destroy ]

  # GET /provenance_records or /provenance_records.json
  def index
    @provenance_records = ProvenanceRecord.all
    if (params[:column])
      @provenance_records = ProvenanceRecord.all.order("#{params[:column]} asc")
    end
    if (params[:column] == "accession_number")
      @provenance_records = @provenance_records.sort_by{|p| p.accession_number.to_i}
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provenance_record
      @provenance_record = ProvenanceRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def provenance_record_params
      params.require(:provenance_record).permit(:accession_number, :collection_name, :collection_name_alpha, :start_year, :end_year, :date_expression, :year_received, :month_received, :day_received, :linear_feet, :containers, :unlist, :provenance_files => [])
    end
end
