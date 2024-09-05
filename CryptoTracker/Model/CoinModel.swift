//
//  CoinModel.swift
//  CryptoTracker
//
//  Created by Valeh Ismayilov on 29.08.24.
//

import Foundation

struct Coin: Codable, Identifiable, Equatable  {
   let id: String
   let name: String
   let symbol: String
   let image: String
   let currentPrice: Double
   let priceChangePercentage24h: Double

   enum CodingKeys: String, CodingKey {
	  case id
	  case name
	  case symbol
	  case image
	  case currentPrice = "current_price"
	  case priceChangePercentage24h = "price_change_percentage_24h"
   }
}
