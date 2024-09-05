//
//  CoinGraphModel.swift
//  CryptoTracker
//
//  Created by Valeh Ismayilov on 31.08.24.
//

import Foundation
import Charts

struct CoinData: Codable {
   let prices: [[Double]]
   let market_caps: [[Double]]
   let total_volumes: [[Double]]
}

struct CoinGraphModel: Codable {
   var timestamp: Double
   var value: Double
}

struct CoinGraphData {
   let prices: [CoinGraphModel]
   let market_caps: [CoinGraphModel]
   let total_volumes: [CoinGraphModel]
}

extension CoinGraphData {
   static func fromCoinData(_ data: CoinData) -> CoinGraphData {
	  let prices = data.prices.map { CoinGraphModel(timestamp: $0[0], value: $0[1]) }
	  let marketCaps = data.market_caps.map { CoinGraphModel(timestamp: $0[0], value: $0[1]) }
	  let totalVolumes = data.total_volumes.map { CoinGraphModel(timestamp: $0[0], value: $0[1]) }
	  return CoinGraphData(prices: prices, market_caps: marketCaps, total_volumes: totalVolumes)
   }
}
