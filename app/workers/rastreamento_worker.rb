class RastreamentoWorker
  include Sidekiq::Worker

  def perform(rastreamento_params)
    rastreamento = Rastreamento.new(rastreamento_params)
    rastreamento.save
  end

end