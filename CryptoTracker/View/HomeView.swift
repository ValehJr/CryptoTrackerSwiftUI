//
//  HomeView.swift
//  CryptoTracker
//
//  Created by Valeh Ismayilov on 28.08.24.
//

import SwiftUI

struct HomeView: View {
   var body: some View {
	  ZStack {
		 Color("Background")
			.edgesIgnoringSafeArea(.all)
		 VStack {
			Text("Home")
			   .font(.custom("Inter_28pt-SemiBold", size: 24))
			   .foregroundStyle(.neutral200)

			HStack {
			   Text("Crypto Coins")
				  .font(.custom("Inter_28pt-Medium", size: 20))
				  .foregroundStyle(.neutral200)
			   Spacer()
			}
			.padding(.leading)
			.padding(.vertical,5)


			ScrollView(.vertical,showsIndicators: false,content: {
			   CryptoGridView()
			})//ScrollView
		 }//V
		 .padding(.bottom)
	  }//Z
	  .frame(maxWidth: .infinity,maxHeight: .infinity)
   }
}

#Preview {
   HomeView()

}
