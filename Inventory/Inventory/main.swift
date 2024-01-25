//
//  main.swift
//  Inventory
//
//  Created by StudentAM on 1/16/24.
//

import Foundation

//initialize vars
var opt: Int = 0
var price: Double = 0.0
let id: Int = 1234
var bought = [0,0,0,0]
var stock = [100,100,100,100]
var prices = [4.99,4.99,3.99,2.99]
var items = ["cereal", "milk", "syrup", "cups"]
//main loop
while opt != -1{
    print("\nWelcome to the grocery store! Lets us know how we can help you (Enter number of selection):\n1. Add item to cart\n2. Remove item for cart\n3. Check if item is in stock\n4. Admin Menu\n5. Checkout\n6. Empty Cart")
    opt = Int(readLine()!)!
    switch opt{
    case 1:
        add()
    case 2:
        delete()
    case 3:
        check()
    case 4:
        admin()
    case 5:
        out()
        opt = -1
        break
    case 6:
        clear()
    default:
        print("Please choose an appropriate option!")
    }
}
//option functions
func add(){
    print("What would you like to add to cart? (Enter number of selection)\n1. Cereal\n2. Milk\n3. Syrup\n4. Cups")
    let index: Int = Int(readLine()!)!
    let item = items[index-1]
    print("How many \(item) would you like to add to your cart?:")
    let many: Double = Double(readLine()!)!
    stock[index-1] -= Int(many)
    if(stock[index-1] >= 0){
        print("You have added \(Int(many)) \(item) to your cart!")
        price += round(prices[index-1]*many*100)/100.0
        print("Current total is: $\(price)")
        bought[index-1] = Int(many)
    }else{
        stock[index-1] += Int(many)
        print("Sorry! You cannot buy that many \(item). There are only \(stock[index-1]) \(item) left.")
        print("\nCurrent total is: $\(price)")
    }
}
func delete(){
    print("What would you like to remove from cart? (Enter number of selection)\n1. Cereal\n2. Milk\n3. Syrup\n4. Cups")
    let index: Int = Int(readLine()!)!
    print("How many \(items[index-1]) would you like to remove from your cart?:")
    let many: Double = Double(readLine()!)!
    stock[index-1] += Int(many)
    bought[index-1] -= Int(many)
    price -= prices[index-1]*many
    price = round(price*100)/100
    print("Removed \(Int(many)) from the cart!")
    print("Current total is: $\(price)")
}
func check(){
    print("What item would you like to check if it's in stock? (Enter number of selection)\n1. Cereal\n2. Milk\n3. Syrup\n4. Cups")
    let index: Int = Int(readLine()!)!
    print("There are currently \(stock[index-1]) \(items[index-1]) in stock!")
}
func admin(){
    print("Enter Admin ID:")
    var pass: Int = Int(readLine()!)!
    if(pass != id){
        print("Incorrect ID, please enter the right ID to open admin menu.")
    }
    while(pass == id){
        print("\nWelcome to the Admin menu! Lets us know how we can help you (Enter number of selection):\n1. Restock inventory\n2. Generate report\n3. Check number of items\n4. Quit admin menu")
        let choice: Int = Int(readLine()!)!
        switch choice{
        case 1:
            print("What would you like to restock? (Enter number of selection):\n1. Cereal\n2. Milk\n3. Syrup\n4. Cups")
            let index: Int = Int(readLine()!)!
            print("How many units of \(items[index-1]) would you like to restock?:")
            let many: Int = Int(readLine()!)!
            stock[index-1] += many
            print("Restocked \(many) units of \(items[index-1])")
        case 2:
            print("Summary Report:")
            var inv: Int = 0
            for i in 0...3{
                print("Remaining \(items[i])s: \(stock[i]) items")
                inv += stock[i]
            }
            print("Remaining Inventory: \(inv) items\nTotal Sales: $\(price)")
        case 3:
            check()
        case 4:
            print("Returning to normal menu")
            pass = 5858
        default:
            break
        }
    }
}
func out(){
    print("Thanks for shopping with us!")
    print("You purchases the following:")
    for i in 0...3{
        print("\(items[i]): \(bought[i])")
    }
    print("Your grand total including tax (9.25%) is: \(round(price*1.0925*100)/100.00)")
}
func clear(){
    price=0.0;
    for i in 0...3{
        stock[i]+=bought[i]
        bought[i]=0
    }
    print("Your cart has been emptied!")
    print("Current total is: $\(price)")
}

