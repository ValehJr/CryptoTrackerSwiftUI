//
//  NetworkManager.swift
//  CryptoTracker
//
//  Created by Valeh Ismayilov on 29.08.24.
//

import Foundation


class NetworkManager {
   func fetchCoinData(from url: URL, completion: @escaping (Result<CoinGraphData, Error>) -> Void) {
	  let task = URLSession.shared.dataTask(with: url) { data, response, error in
		 if let error = error {
			completion(.failure(error))
			return
		 }
		 guard let data = data else {
			let error = NSError(domain: "Invalid data", code: -1, userInfo: nil)
			completion(.failure(error))
			return
		 }
		 do {
			let decodedData = try JSONDecoder().decode(CoinData.self, from: data)
			let coinGraphData = CoinGraphData.fromCoinData(decodedData)
			completion(.success(coinGraphData))
		 } catch {
			completion(.failure(error))
		 }
	  }
	  task.resume()
   }
}

