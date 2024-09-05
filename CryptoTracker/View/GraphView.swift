//
//  GraphView.swift
//  CryptoTracker
//
//  Created by Valeh Ismayilov on 28.08.24.
//

import SwiftUI

struct GraphView: View {
    var body: some View {
	   ZStack {
		  Color("Background")
			 .edgesIgnoringSafeArea(.all)
		  VStack {
			 Text("Graphs")
				.font(.custom("Inter_28pt-SemiBold", size: 24))
				.foregroundStyle(.neutral200)
			 Spacer()
		  }//V
	   }//Z
	   .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

#Preview {
    GraphView()
}
