//
//  Constant.swift
//  CryptoTracker
//
//  Created by Valeh Ismayilov on 28.08.24.
//

import Foundation
import SwiftUI

let rowSpacing:CGFloat = 10
var gridLayout: [GridItem] {
   return Array(repeating: GridItem(.flexible(),spacing: rowSpacing), count: 2)
}
let apiUrl = "https://api.coingecko.com/api/v3"
let fakeApiUrl = "https://66d16dd062816af9a4f39822.mockapi.io/coins"
let fakeGraphURL = "https://66d16dd062816af9a4f39822.mockapi.io/prices"
