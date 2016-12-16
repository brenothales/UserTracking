json.array!(@rastreamentos) do |rastreamento|
  json.extract! rastreamento, :id, :visitante, :url, :titulo, :data_hora
  json.url rastreamento_url(rastreamento, format: :json)
end
