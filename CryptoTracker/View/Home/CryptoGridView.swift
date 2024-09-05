//
//  CryptoGridView.swift
//  CryptoTracker
//
//  Created by Valeh Ismayilov on 28.08.24.
//

import SwiftUI

struct CryptoGridView: View {

   @State var cryptoVM = CryptoGridModelView()

   var body: some View {
	  LazyVGrid(columns: gridLayout, spacing: 16) {
		 ForEach(cryptoVM.coins) { coin in
			NavigationLink(destination: CryptoInfoView(coin: coin)) {
			   CryptoDetailView(coin: coin)
				  .onAppear {
					 if coin == cryptoVM.coins.last {
						cryptoVM.fetchCoins()
						print("Update")
					 }
				  }
			}
		 }
		 
		 if cryptoVM.isLoading {
			ProgressView()
			   .frame(maxWidth: .infinity, alignment: .center)
			   .padding()
		 }
	  }
	  .padding(.vertical, 10)
	  .onAppear {
		 cryptoVM.fetchCoins()
	  }
   }
}

#Preview {
   CryptoGridView()
}
