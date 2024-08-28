//
//  CryptoGridView.swift
//  CryptoTracker
//
//  Created by Valeh Ismayilov on 28.08.24.
//

import SwiftUI

struct CryptoGridView: View {
    var body: some View {
        LazyVGrid(columns: gridLayout,spacing: 16 ,content: {
		   ForEach(0 ..< 16) { coin in
			  CryptoDetailView()
		   }//LOOP
		})//VGrid
		.padding(.vertical,10)
    }
}

#Preview {
    CryptoGridView()
}
