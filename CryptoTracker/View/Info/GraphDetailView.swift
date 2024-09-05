//
//  GraphDetailView.swift
//  CryptoTracker
//
//  Created by Valeh Ismayilov on 28.08.24.
//

import SwiftUI
import Charts

struct GraphDetailView: View {

   @State var graphVM = GraphViewModel()
   @State var selectedTime: String = "1d"

   var coin:Coin

   var body: some View {

	  let priceValues = graphVM.coinPrices.map { $0.value }
	  let minPrice = (priceValues.min() ?? 0) * 0.99
	  let maxPrice = (priceValues.max() ?? 0) * 1.01

	  VStack {
		 Chart(graphVM.coinPrices, id: \.timestamp) { item in
			AreaMark(
			   x: .value("Time", Date(timeIntervalSince1970: item.timestamp / 1000)),
			   yStart: .value("Price", minPrice),
			   yEnd: .value("Price", item.value)
			)
			.foregroundStyle(LinearGradient(
			   gradient: Gradient(colors: [.primary500,.primary100]),
			   startPoint: .top,
			   endPoint: .bottom)
			)

		 }//Chart
		 .onAppear {
			graphVM.coinPrices = []
			updateGraphData()
		 }
		 .onChange(of: selectedTime) {
			graphVM.coinPrices = []
			updateGraphData()
			print("Changed")
		 }
		 .chartYScale(domain: minPrice...maxPrice)
		 .chartXAxis(.hidden)
		 .chartYAxis(.hidden)
		 .frame(maxWidth: 320, maxHeight: 500)
		 .clipShape(RoundedRectangle(cornerRadius: 12))

		 Spacer()

		 TimeSelectionView(selectedTime: $selectedTime)
	  }//V
   }

   private func updateGraphData() {
	  if selectedTime.hasSuffix("h") {

		 print("h")
		 if let hours = Int(selectedTime.dropLast()) {
			let currentTime = Date().timeIntervalSince1970
			let pastTime = currentTime - Double(hours * 3600)
			print(currentTime)
			print(pastTime)
			graphVM.fetchCoins(with: coin.id, start: pastTime, end: currentTime)
		 }
	  } else {
		 let days = String(selectedTime.first ?? "7")
		 graphVM.fetchCoins(with: coin.id, days: days)
	  }
   }
}

#Preview {
   GraphDetailView(coin: Coin(id: "bitcoin", name: "Bitcoin", symbol: "BTC", image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400", currentPrice: 59482, priceChangePercentage24h: -0.76908))
}
