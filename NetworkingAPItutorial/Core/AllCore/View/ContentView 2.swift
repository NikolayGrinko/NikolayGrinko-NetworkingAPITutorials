//
//  ContentView.swift
//  NetworkingAPItutorial
//
//  Created by Николай Гринько on 25.01.2024.
//

import Foundation
import SwiftUI


struct ContentView: View {
	@StateObject var viewModel = CoinsViewModel()
	
	var body: some View {
	VStack {
		
		Text("\(viewModel.coin): \(viewModel.price)")
	}
	.padding()
}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}


// API KEY - CG-tbkinZhFtMbp6JYRptusJLHd
