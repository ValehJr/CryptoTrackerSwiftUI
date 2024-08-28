//
//  ContentView.swift
//  CryptoTracker
//
//  Created by Valeh Ismayilov on 28.08.24.
//

import SwiftUI

struct ContentView: View {
   var body: some View {
	  TabView {
		 HomeView()
			.tabItem {
			   Label("Home", systemImage: "house.fill")
			}
		 GraphView()
			.tabItem { Label("Graph", systemImage: "chart.line.uptrend.xyaxis") }
	  }
   }
}

#Preview {
   ContentView()
}
