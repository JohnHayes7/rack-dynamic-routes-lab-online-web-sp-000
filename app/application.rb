require "pry"
class Application
  
   def call(env)
  
    resp = Rack::Response.new 
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
    item_name = req.path.split("/items/").last
      if @@items.find{|i| i.name == item_name}
        item = @@items.find{|i| i.name == item_name}
        item.price
        
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status = 404
      resp.write "Invalid Path"
    end
   end
   
end