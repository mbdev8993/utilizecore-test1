class ParcelRecordsController < ApplicationController
  before_action :set_parcel_record, only: %i[ show edit update destroy ]

  # GET /parcel_records or /parcel_records.json
  def index
    @parcel_records = ParcelRecord.all
  end

  # GET /parcel_records/1 or /parcel_records/1.json
  def show
  end

  # GET /parcel_records/new
  def new
    @parcel_record = ParcelRecord.new
  end

  # GET /parcel_records/1/edit
  def edit
  end

  # POST /parcel_records or /parcel_records.json
  def create
    @parcel_record = ParcelRecord.new(parcel_record_params)

    respond_to do |format|
      if @parcel_record.save
        format.html { redirect_to @parcel_record, notice: "Parcel record was successfully created." }
        format.json { render :show, status: :created, location: @parcel_record }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @parcel_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parcel_records/1 or /parcel_records/1.json
  def update
    respond_to do |format|
      if @parcel_record.update(parcel_record_params)
        format.html { redirect_to @parcel_record, notice: "Parcel record was successfully updated." }
        format.json { render :show, status: :ok, location: @parcel_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parcel_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parcel_records/1 or /parcel_records/1.json
  def destroy
    @parcel_record.destroy
    respond_to do |format|
      format.html { redirect_to parcel_records_url, notice: "Parcel record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def download_csv
    send_data File.open(params[:url]).read, :disposition => 'attachment', :filename=>"#{params[:file_name]}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parcel_record
      @parcel_record = ParcelRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def parcel_record_params
      params.require(:parcel_record).permit(:file)
    end
end
