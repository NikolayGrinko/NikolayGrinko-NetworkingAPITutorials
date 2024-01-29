//
//  CoinsViewModel.swift
//  NetworkingAPItutorial
//
//  Created by Николай Гринько on 25.01.2024.
//

import Foundation


class CoinsViewModel: ObservableObject {
	
	@Published var coins = [Coin]()
	@Published var errorMessage: String?
	//	@Published var coin = ""
	//	@Published var price = ""
	
	
	
	
	
	private let service = CoinDataService()
	
	init() {
		fetchCoinsWithCompletionHandler()
		Task { try await fetchCoins() }
	}
	
	func fetchCoins() async throws {
		self.coins = try await service.fetchCoins()
	}
	
	
	func fetchCoinsWithCompletionHandler() {
		service.fetchCoinsWithResult { [weak self] result in
			DispatchQueue.main.async {
				switch result {
					case .success(let coins):
						self?.coins = coins
					case .failure(let error):
						self?.errorMessage = error.localizedDescription
				}
			}
		}
	}
}
