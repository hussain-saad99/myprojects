//
//  RestList.swift
//  HalalFoodFinder
//
//  Created by Saad Hussain on 3/14/24.
//

import Foundation

struct Location : Codable {
    var formatted_address : String = ""
}
struct Tag : Codable {
    var name : String = ""
}
struct Restaurant: Codable{
    var categories : [Tag]?
    var location : Location?
    var name: String = ""
}
struct RestList : Codable {
    var results : [Restaurant]?
}
