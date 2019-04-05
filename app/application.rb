require "pry"
class Application
  
  def call(env)
    
    resp = Rack::Response.new 
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      binding.pry
      if @@items.include?(item_name)
        # binding.pry
        item = @@items.find{|i| i.name == item_name}
        
        resp.write item.price
      else
        resp.status 400
        resp.write "We do not have that item"
      end
    else
      resp.status = 404
      resp.write "404 Route Not Found"
    end
   end 
end