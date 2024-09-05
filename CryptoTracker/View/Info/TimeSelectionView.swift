//
//  TimeSelectionView.swift
//  CryptoTracker
//
//  Created by Valeh Ismayilov on 29.08.24.
//

import SwiftUI

struct TimeSelectionView: View {
   @Binding var selectedTime: String

   let options = ["1h","3h" ,"12h", "1d", "3d", "7d"]

   var body: some View {
	  ZStack {
		 RoundedRectangle(cornerRadius: 12)
			.frame(maxWidth: 280,maxHeight: 36)
			.foregroundStyle(.background2)
		 HStack {
			ForEach(options, id: \.self) { option in
			   Button(action: {
				  selectedTime = option
			   }) {
				  Text(option)
					 .font(.custom("Inter_28pt-Regular", size: 14))
					 .lineLimit(1)
					 .padding(.horizontal,10)
					 .foregroundStyle(selectedTime == option ? Color.primary300 : Color.white)
			   }
			}
		 }
	  }
   }
}

#Preview {

   @State var selectedTime = "7"
   return TimeSelectionView(selectedTime: $selectedTime)
}
