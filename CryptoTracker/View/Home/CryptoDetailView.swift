//
//  CryptoDetailView.swift
//  CryptoTracker
//
//  Created by Valeh Ismayilov on 28.08.24.
//

import SwiftUI

struct CryptoDetailView: View {
   let coin: Coin

   var body: some View {
	  VStack {
		 HStack {
			AsyncImage(url: URL(string: coin.image)) { image in
			   image
				  .resizable()
				  .frame(width: 24, height: 24)
				  .scaledToFill()
			} placeholder: {
			   Image(systemName: "circle")
				  .resizable()
				  .frame(width: 24, height: 24)
				  .scaledToFill()
			}

			Text(coin.symbol.uppercased())
			   .font(.custom("Inter_28pt-Medium", size: 14))
			   .foregroundStyle(.neutral200)
			Spacer()
		 }
		 .padding(.vertical, 12)
		 .padding(.leading, 12)

		 HStack {
			Text("$\(String(coin.currentPrice))")
			   .font(.custom("Inter_28pt-Medium", size: 22))
			   .minimumScaleFactor(0.6)
			   .foregroundStyle(.neutral200)
			Text(String(format: "%.2f%%", coin.priceChangePercentage24h))
			   .font(.custom("Inter_28pt-Regular", size: 14))
			   .foregroundStyle(coin.priceChangePercentage24h >= 0 ? .success200 : .error300)
			Spacer()
		 }
		 .padding(.bottom)
		 .padding(.leading, 12)
	  }
	  .frame(maxWidth: 156, maxHeight: 92)
	  .overlay(
		 RoundedRectangle(cornerRadius: 12)
			.stroke(.neutral200, lineWidth: 1)
	  )
	  .background(Color(.background))
   }
}
#Preview {
   CryptoDetailView(coin: Coin(id: "bitcoin", name: "Bitcoin", symbol: "BTC", image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400", currentPrice: 59482, priceChangePercentage24h: 0.76908))
}
