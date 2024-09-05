//
//  CryptoGridModelView.swift
//  CryptoTracker
//
//  Created by Valeh Ismayilov on 29.08.24.
//

import Foundation

@Observable
class CryptoGridModelView {
   var coins: [Coin] = []
   private var currentPage = 1
   private let limit = 10
   var isLoading = false
   var hasMoreData = true

   func fetchCoins() {
	  guard !isLoading, hasMoreData else { return }

	  isLoading = true

	  guard var components = URLComponents(string: apiUrl) else { return }
	  components.queryItems = [
		 URLQueryItem(name: "page", value: "\(currentPage)"),
		 URLQueryItem(name: "limit", value: "\(limit)")
	  ]

	  guard let url = components.url else {
		 print("Invalid URL")
		 isLoading = false
		 return
	  }

	  let task = URLSession.shared.dataTask(with: url) { data, response, error in
		 defer { self.isLoading = false }

		 if let error = error {
			print("Error fetching data: \(error)")
			return
		 }

		 guard let data = data else {
			print("No data returned")
			return
		 }

		 do {
			let decoder = JSONDecoder()
			let newCoins = try decoder.decode([Coin].self, from: data)

			DispatchQueue.main.async {
			   if newCoins.isEmpty {
				  self.hasMoreData = false
			   } else {
				  self.coins.append(contentsOf: newCoins)
				  self.currentPage += 1
			   }
			}
		 } catch {
			print("Error decoding data: \(error)")
		 }
	  }

	  task.resume()
   }
}
