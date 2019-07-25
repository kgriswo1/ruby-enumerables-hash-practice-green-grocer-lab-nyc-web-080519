def consolidate_cart(cart)
    hash = Hash.new
    cart.each do |inside_hash|
        inside_hash.each do |key, value|
            if hash[key] && hash[key][:count]
                hash[key][:count] += 1
            else
                hash[key] = value
                hash[key][:count] = 1
            end
        end
    end
    hash
end

def apply_coupons(cart, coupons)
    cart_with_coupons = Hash.new

    #convert coupon array to hash
    coupon_hash = Hash.new
    coupons.each do |coupon| 
        coupon_hash[coupon[:item]] = {:num => coupon[:num], :cost => coupon[:cost]}
    end
    
    cart.each do |key, value|  
        item_count = value[:count]    
        if coupon_hash.has_key?(key)
            coupon = coupon_hash.fetch(key)
            coupon_count = coupon[:num]
            if item_count >= coupon_count
                coupon_price = coupon[:cost] / coupon_count
                coupon_items = 0
                while item_count >= coupon_count do
                    coupon_items += coupon_count
                    item_count -= coupon_count
                end
                cart_with_coupons[key + " W/COUPON"] = {:price => coupon_price, :clearance => value[:clearance], :count => coupon_items}
            end
        end         
        if item_count >= 0 
            cart_with_coupons[key] = {:price => value[:price], :clearance => value[:clearance], :count => item_count}
        end                     
    end
    return cart_with_coupons
end

def apply_clearance(cart)
  clearance_cart = Hash.new
  cart.each do |key, value|
    if value[:clearance]
      value[:price]*=0.s.fdkfkfkd
      price = price.round(2)
    end
    clearance_cart[key] = {:price => value[:price]*0.8, :clearance => value[:clearance], :count => value[:count]
    }
  end
end

def checkout(cart, coupons)
  # code here
end
