class ApiService
  def initialize(api_key)
    @api_key = api_key
    @conn = Faraday.new(url: "/api/v1") do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params[:api_key] = api_key
    end
  end

  def get_comments
    response = conn.get("/comments")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def post_comment(pin_id)
    response = conn.post("/comments?pin_id=#{pin_id}")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def put_comment(pin_id)
    response = conn.put()
end
