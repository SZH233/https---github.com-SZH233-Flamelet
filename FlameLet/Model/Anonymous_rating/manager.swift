//
//  managerClass.swift
//  DouBanDemo
//
//  Created by Keyu LI on 31/8/2022.
//

import SwiftUI

struct Manager:Identifiable, Codable{
    var id = UUID()
    let _id : String
    let name: String
    let age: Int
    let gender: String
    var totalRating: Int
    var ratingTime: Int
    var averageRating: Int
    let position: String
    let Image: String
    var comments: String
}
