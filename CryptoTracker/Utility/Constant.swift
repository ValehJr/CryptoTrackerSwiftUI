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
