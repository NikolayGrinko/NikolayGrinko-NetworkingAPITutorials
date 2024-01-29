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
		List {
			ForEach(viewModel.coins) { coin in
				HStack {
					Text("\(coin.marketCapRanc)")
						.foregroundColor(.gray)
					
					VStack(alignment: .leading, spacing: 4) {
						Text(coin.name)
							.fontWeight(.semibold)
						
						Text(coin.symbol.uppercased())
					}
				}
				.font(.footnote)
			}
		}
		.overlay {
			if let error = viewModel.errorMessage {
				Text(error)
			}
		}
}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}


// API KEY - CG-tbkinZhFtMbp6JYRptusJLHd
