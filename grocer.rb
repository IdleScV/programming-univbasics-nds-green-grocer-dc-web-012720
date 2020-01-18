def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  count = 0
  while count < collection.length do
    if collection[count][:item] == name
      return collection[count]
    end
    count += 1
  end
  return nil
end

def consolidate_cart(cart)
  count = 0
  arr = []
  setter = []
  while count < cart.length do
    if setter.include? cart[count]
      idx = setter.index(cart[count])
      arr[idx][:count] = arr[idx][:count] + 1
      
    else
      
      setter.push(cart[count]);
      key = cart[count]
      key[:count] = 1
      arr.push(key);
      
    end
    count += 1
  end
  
  return arr 
end

def apply_coupons(cart, coupons)
  
  count = 0;
  runtime = cart.length
  
  # iterate through coupons
  while count < coupons.length do
    cartcount = 0
    
    #! Find item in cart that matches coupon
    while cartcount < runtime do
      if coupons[count][:item] == cart[cartcount][:item] 
        
        # Finds num of items that isn't on sale
        leftover = cart[cartcount][:count] - ((cart[cartcount][:count] / coupons[count][:num]).floor * coupons[count][:num])
        
        
       
        
        # Adds couponed hash to end of cart
        cart.push(cart[cartcount])
        cart[cart.length - 1][:item] = (cart[cartcount][:item] +" W/COUPON")
        cart[cart.length - 1][:price] = coupons[count][:cost] / coupons[count][:num]
        cart[cart.length - 1][:count] = cart[cartcount][:count] - leftover 
        
        # updates original cart with num items that don't apply discount
        cart[cartcount][:count] = leftover
        
      end
      
      cartcount += 1
    end
    
    count += 1
  end
  return cart
end

def apply_clearance(cart)
  count = 0
  new = []
  while count < cart.length do
    new.push(cart[count])
    if new[count][:clearance] == true
      new[count][:price] = new[count][:price] * 0.8
    end
    count += 1
  end
  return new
end

def checkout(cart, coupons)
  
  cart = consolidate_cart(cart)
  cart = apply_coupons(cart, coupons)
  cart = apply_clearance(cart)
  
  sum = 0
  count = 0
  while count < cart.length do
    sum = sum + (cart[:price] * cart[:count])
    count += 1
  end
  return sum
end
