//
//  GraphModelView.swift
//  CryptoTracker
//
//  Created by Valeh Ismayilov on 31.08.24.
//

import Foundation
import SwiftUI

@Observable
class GraphViewModel {

   let networkManager = NetworkManager()

   var coinPrices: [CoinGraphModel] = []

   func fetchCoins(with id: String, start: TimeInterval, end: TimeInterval) {
	  let url = URL(string: "\(apiUrl)/coins/\(id)/market_chart/range?vs_currency=usd&from=\(start)&to=\(end)")!
	  networkManager.fetchCoinData(from: url) { result in
		 switch result {
			case .success(let coinGraphData):
			   self.coinPrices = coinGraphData.prices
			case .failure(let error):
			   print("Failed to fetch data: \(error)")
		 }
	  }
   }

   func fetchCoins(with id: String, days: String) {
	  let url = URL(string: "\(apiUrl)/coins/\(id)/market_chart?vs_currency=usd&days=\(days)")!
	  networkManager.fetchCoinData(from: url) { result in
		 switch result {
			case .success(let coinGraphData):
			   self.coinPrices = coinGraphData.prices
			case .failure(let error):
			   print("Failed to fetch data: \(error)")
		 }
	  }
   }
}
