class Player
    # include Players::Human
    # include Players::Computer
    attr_reader :token

def initialize(token)
  token=(token)
  @token = token
end

def token
    @token
end
 

end