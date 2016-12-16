class RastreamentosController < ApplicationController
  before_action :set_rastreamento, only: [:show, :edit, :update, :destroy]

  skip_before_action :verify_authenticity_token

  # GET /rastreamentos
  # GET /rastreamentos.json
  def index
    @rastreamentos = Rastreamento.all.order("data_hora desc").limit(50)
  end

  # GET /rastreamentos/1
  # GET /rastreamentos/1.json
  def show
  end

  # GET /rastreamentos/new
  def new
    @rastreamento = Rastreamento.new
  end

  # GET /rastreamentos/1/edit
  def edit
  end

  # POST /rastreamentos
  # POST /rastreamentos.json
  def create
    mensagem = validate_params

    if !mensagem.empty?
      return respond_to do |format|
        format.json { render json: mensagem, status: :bad_request }
      end
    end

    @rastreamento = Rastreamento.new(rastreamento_params)

    respond_to do |format|
      if ENV['USE_SIDEKIQ'] == "true"
        RastreamentoWorker.perform_async(rastreamento_params)
        format.json { render :nothing => true, status: :created }
      else
        if @rastreamento.save
          format.html { redirect_to @rastreamento, notice: 'Rastreamento was successfully created.' }
          format.json { render :nothing => true, status: :created }
        else
          format.html { render :new }
          format.json { render json: @rastreamento.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /rastreamentos/1
  # PATCH/PUT /rastreamentos/1.json
  def update
    respond_to do |format|
      if @rastreamento.update(rastreamento_params)
        format.html { redirect_to @rastreamento, notice: 'Rastreamento was successfully updated.' }
        format.json { render :show, status: :ok, location: @rastreamento }
      else
        format.html { render :edit }
        format.json { render json: @rastreamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rastreamentos/1
  # DELETE /rastreamentos/1.json
  def destroy
    @rastreamento.destroy
    respond_to do |format|
      format.html { redirect_to rastreamentos_url, notice: 'Rastreamento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_rastreamento
    @rastreamento = Rastreamento.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def rastreamento_params
    params.require(:rastreamento).permit(:visitante, :url, :titulo, :data_hora)
  end

  def validate_params
    mensagem = []
    mensagem << 'Parâmetro visitante inexistente.' if params[:rastreamento][:visitante].nil? || params[:rastreamento][:visitante].empty?
    mensagem << 'Parâmetro url inexistente.' if params[:rastreamento][:url].nil? || params[:rastreamento][:url].empty?
    mensagem << 'Parâmetro título inexistente.' if params[:rastreamento][:titulo].nil? || params[:rastreamento][:titulo].empty?
    mensagem << 'Parâmetro data/hora inexistente.' if params[:rastreamento][:data_hora].nil? || params[:rastreamento][:data_hora].empty?
    mensagem_formatted = format_message(mensagem)
    return {mensagem: mensagem_formatted}.to_json if !mensagem.empty?
    ''
  end

  def format_message(mensagem)
    msg = ''
    mensagem.each_with_index do |m, index|
      msg += m
      msg += " " if index < mensagem.count - 1
    end
    msg
  end
end
