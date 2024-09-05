//
//  CryptoInfoView.swift
//  CryptoTracker
//
//  Created by Valeh Ismayilov on 29.08.24.
//

import SwiftUI

struct CryptoInfoView: View {
   var coin:Coin

   @State var graphVM = GraphViewModel()

   var body: some View {
	  ZStack {
		 Color("Background")
			.edgesIgnoringSafeArea(.all)
		 VStack {

			HStack {
			   AsyncImage(url: URL(string: coin.image)) { image in
				  image
					 .resizable()
					 .frame(width: 48, height: 48)
					 .scaledToFill()
			   } placeholder: {
				  Image(systemName: "circle")
					 .resizable()
					 .frame(width: 24, height: 24)
					 .scaledToFill()
			   }

			   VStack(alignment:.leading) {
				  Text(coin.symbol)
					 .font(.custom("Inter_28pt-Medium", size: 18))
					 .foregroundStyle(.neutral200)


				  Text(coin.name)
					 .font(.custom("Inter_28pt-Medium", size: 18))
					 .foregroundStyle(.neutral700)
			   }.padding(.horizontal,10)

			   Spacer()

			   VStack(alignment:.trailing) {
				  Text("$\(String(coin.currentPrice))")
					 .font(.custom("Inter_28pt-Medium", size: 18))
					 .minimumScaleFactor(0.6)
					 .foregroundStyle(.neutral200)

				  Text(String(format: "%.2f% %", coin.priceChangePercentage24h))
					 .font(.custom("Inter_28pt-Regular", size: 14))
					 .foregroundStyle(coin.priceChangePercentage24h >= 0 ? .success200 : .error300)
			   }
			}//H
			.padding(.horizontal)
			.padding(.vertical,5)
			.padding(.bottom,50)


			GraphDetailView(coin: coin)


		 }//V
	  }//Z
	  .frame(maxWidth: .infinity,maxHeight: .infinity)
	  .onAppear {

	  }
   }
}

#Preview {
   CryptoInfoView(coin: Coin(id: "bitcoin", name: "Bitcoin", symbol: "BTC", image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400", currentPrice: 59482, priceChangePercentage24h: -0.76908))
}
