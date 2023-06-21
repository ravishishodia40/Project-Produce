//
//  ProjectProduct.swift
//
//  Created by Project Produce on ____.

import Foundation

// 1. Define a structure that can feed data to our app
struct ProductData {
    let productName: String
    let productDescription: String
    let productPrice: Double
}

// 2. Create a class for our product 
class Product {
    let name: String
    let description: String
    let price: Double
    
    init(name: String, description: String, price: Double) {
        self.name = name
        self.description = description
        self.price = price
    }
}

// 3. Create a protocol for our product class
protocol ProductListDelegate {
    func didUpdateProductList()
    func didRemoveProductFromList()
    func didAddProductToList()
}

// 4. Create an array to hold our products
var productList = [Product]()

// 5. Create a method to populate our product list
func populateProductList(with data: [ProductData]) {
    productList.removeAll()
    for productData in data {
        let name = productData.productName
        let description = productData.productDescription
        let price = productData.productPrice
        let product = Product(name: name, description: description, price: price)
        productList.append(product)
    }
}

// 6. Create a method to add a product to the list
func addProductToList(product: Product) {
    productList.append(product)
}

// 7. Create a method to remove a product from the list
func removeProductFromList(at index: Int) {
    productList.remove(at: index)
}

// 8. Create a method to get the total price of all the products in the list
func getTotalProductPrice() -> Double {
    var totalPrice: Double = 0.0
    for product in productList {
        totalPrice += product.price
    }
    
    return totalPrice
}

// 9. Create a method to sort the products by price
func sortProductListByPriceAscending() {
    productList.sort{ $0.price < $1.price }
}

// 10. Create a method to sort the products by name
func sortProductListByNameAscending() {
    productList.sort{ $0.name < $1.name }
}