//
//  CryptoDetailView.swift
//  CryptoTracker
//
//  Created by Valeh Ismayilov on 28.08.24.
//

import SwiftUI

struct CryptoDetailView: View {
   var body: some View {
	  VStack {
		 HStack {
			Image(systemName: "circle")
			   .resizable()
			   .frame(maxWidth: 24,maxHeight: 24)
			   .scaledToFill()
			   .foregroundStyle(.neutral200)

			Text("ETH")
			   .font(.custom("Inter_28pt-Medium", size: 14))
			   .foregroundStyle(.neutral200)
			Spacer()
		 }//H
		 .padding(.vertical,12)
		 .padding(.leading,12)

		 HStack {
			Text("$10025")
			   .font(.custom("Inter_28pt-Medium", size: 22))
			   .foregroundStyle(.neutral200)
			Text("49%")
			   .font(.custom("Inter_28pt-Regular", size: 14))
			   .foregroundStyle(.success200)
			Spacer()
		 }//H
		 .padding(.bottom)
		 .padding(.leading,12)
	  }//V
	  .frame(maxWidth: 156,maxHeight: 92)
	  .overlay(
		 RoundedRectangle(cornerRadius: 12)
			.stroke(.neutral200, lineWidth: 1)
	  )
	  .background(Color(.background))
   }
}

#Preview {
   CryptoDetailView()
}
