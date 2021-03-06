def pet_shop_name(shop)
  return shop[:name]
end

def total_cash(shop)
  return shop[:admin][:total_cash]
end

# If we wanted to improve it we would pass another argument
# saying add or remove and then the amount
# that way you don't need to use negative numbers to remove

def add_or_remove_cash(shop, amount)
  return shop[:admin][:total_cash] += amount
end

def pets_sold(shop)
  return shop[:admin][:pets_sold]
end

def increase_pets_sold(shop, amount)
  return shop[:admin][:pets_sold] += amount
end

def stock_count(shop)

  # counter = 0
  #
  # for animals in shop[:pets]
  #   counter += 1
  # end
  #
  # return counter

  shop[:pets].length

end

def pets_by_breed(shop, breed)

  counter_arr = []
  pets = shop[:pets]

  for pet in pets
    counter_arr.push(pet[:name]) if pet[:breed] == breed
  end

  return counter_arr

end

def find_pet_by_name(shop, name)

  pets = shop[:pets]

  for pet in pets
    if pet[:name] == name
      return pet
    end
  end
  return nil
end


# Have a second look to it pets.delete(pet) could be
# problematic even if the test passes

def remove_pet_by_name(shop, name)
  pets = shop[:pets]

  for pet in pets
    if pet[:name] == name
      pets.delete(pet)
    end
  end

end

def add_pet_to_stock(shop, new_pet)
  return shop[:pets].push(new_pet)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  return customer[:cash] -= amount
end

def customer_pet_count(customer)
  return customer[:pets].length
end

def add_pet_to_customer(customer, new_pet)
  return customer[:pets].push(new_pet)
end

# Optional

def customer_can_afford_pet(customer, new_pet)

  if customer[:cash] >= new_pet[:price]
    return true
  end

  return false

end

def sell_pet_to_customer(shop, new_pet, customer)
  # if no pet found return nil // They don't ask to return that
  # if enough money customer we transfer pet
  # to the customer
  # after that we remove money from customer and put on shop

  return if new_pet == nil # I don't need to return anything
  # if new_pet == nil
  #   return nil
  #   # return find_pet_by_name(shop, new_pet)
  # end

  if customer_can_afford_pet(customer, new_pet) == true

    add_pet_to_customer(customer, new_pet)
    remove_customer_cash(customer, new_pet[:price])
    remove_pet_by_name(shop, new_pet[:name])
    shop[:admin][:total_cash] += new_pet[:price]
    shop[:admin][:pets_sold] += 1

  end

  # return false # No need to return anything

end
