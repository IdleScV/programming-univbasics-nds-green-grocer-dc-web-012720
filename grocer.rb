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
  counter = 0;
  while counter < coupons.length
    cart_item = find_item_by_name_in_collection(coupons[counter][:item], cart)
    couponed = "#{coupons[counter][:item]} W/COUPON"
    cart_item_with_coupon = find_item_by_name_in_collection(couponed, cart)
    if cart_item && cart_item[:count] >= coupons[counter][:num]
      if cart_item_with_coupon
        cart_item_with_coupon[:count] += coupons[counter][:num]
        cart_item[:item]
    
    
    
    end
    counter += 1
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
