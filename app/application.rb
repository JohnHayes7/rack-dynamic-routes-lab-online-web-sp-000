require "pry"
class Application
  
   def call(env)
  
    resp = Rack::Response.new 
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
    item_name = req.path
    binding.pry
      if @@items.each{|i| i.name ==
        
      end
    else
      resp.status = 404
      resp.write "Invalid Path"
    end
   end
   
end