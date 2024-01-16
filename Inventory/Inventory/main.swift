//
//  main.swift
//  Inventory
//
//  Created by StudentAM on 1/16/24.
//

import Foundation
var opt: Int = 0
var bought = [0,0,0,0]
var stock = [100,100,100,100]
while opt<5{
    print("Welcome to the grocery store! Lets us know how we can help you (Enter number of selection):\n1. Add item to cart\n2. Remove item for cart\n3. Check if item is in stock\n4. Admin Menu\n5. Checkout\n6. Empty Cart")
    opt = Int(readLine()!)!
    switch opt{
    case 1:
        print("h")
    case 2:
        print("w")
    case 3:
        print("g")
    case 4:
        print("j")
    case 5:
        print("h")
    case 6:
        print("j")
    }
}

