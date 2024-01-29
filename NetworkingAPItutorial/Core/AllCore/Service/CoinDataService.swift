//
//  CoinDataService.swift
//  NetworkingAPItutorial
//
//  Created by Николай Гринько on 26.01.2024.
//

import Foundation

class CoinDataService {
	
	private let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&sparkline=false&price_change_percentage=24&locale=en"
	
	func fetchCoins() async throws -> [Coin] {
		
		guard let url = URL(string: urlString) else { return [] }
		do {
			let (data, _) = try await URLSession.shared.data(from: url)
			let coins = try JSONDecoder().decode([Coin].self, from: data)
			return coins
			//print("DEBUG: Response \(response as? HTTPURLResponse)")
			//print("DEBUG: Data id \(data)")
		} catch {
			print("DEBUG: Error \(error.localizedDescription)")
			return []
		}
	}
	
}
	
	extension CoinDataService {
	
	func fetchCoinsWithResult(completion: @escaping(Result<[Coin], CoinAPIError>) -> Void) {
		
		guard let url = URL(string: urlString) else { return }
		
		URLSession.shared.dataTask(with: url) { data, response, error in
			if let error = error {
				completion(.failure(.unknownError(error: error)))
				return
			}
			
			guard let httpResponse = response as? HTTPURLResponse else {
				completion(.failure(.requestFailed(description: "Request failed")))
				return
			}
			guard httpResponse.statusCode == 200 else {
				completion(.failure(.invalidStatusCode(statusCode: httpResponse.statusCode)))
				return
			}
			guard let data = data else {
				completion(.failure(.invalidData))
				return
			}
			
			do {
				let coins = try JSONDecoder().decode([Coin].self, from: data)
				completion(.success(coins))
			} catch {
				print("DEBUG: Failed to decode coins")
				completion(.failure(.jsonParsingFailure))
			}
			
		}.resume()
			}
			
//			for coin in coins {
//				print("DEBUG: Coin id \(coin.name)")
//			}
		
	
	
//	func fetchCoins(completion: @escaping([Coin]?, Error?) -> Void) {
//		
//		guard let url = URL(string: urlString) else { return }
//		
//		URLSession.shared.dataTask(with: url) { data, response, error in
//			if let error = error {
//				completion(nil, error)
//		     return
//			}
//			guard let data = data else { return }
//			
//			guard let coins = try? JSONDecoder().decode([Coin].self, from: data) else {
//				print("DEBUG: Failed to decode coins")
//				return
//			}
//			completion(coins, nil)
////			for coin in coins {
////				print("DEBUG: Coin id \(coin.name)")
////			}
//		}.resume()
//	}
	
	func fetchPrice(coin: String, completion: @escaping(Double) -> Void) {
		
	let urlString = "https://api.coingecko.com/api/v3/simple/price?ids=\(coin)&vs_currencies=usd"
		guard let url = URL(string: urlString) else { return }
		
		
		URLSession.shared.dataTask(with: url) { data, response, error in
		
				if let error = error {
					print("DEBUG: Failed with error \(error.localizedDescription) ")
					//self.errorMessage = error.localizedDescription
					return
				}
				
				guard let httpResponse = response as? HTTPURLResponse else {
					//self.errorMessage = "Bad HTTP Response"
					return
				}
				
				guard httpResponse.statusCode == 200 else {
					//self.errorMessage = "Failed to fetch with status code \(httpResponse.statusCode)"
					return
				}
				
				print("DEBUG: Response code is \(httpResponse.statusCode)")
				
				guard let data = data else { return }
				guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
				
				guard let value = jsonObject[coin] as? [String: Double] else {
					print("Failed to parse value")
					return
					
				}
				guard let price = value["usd"] else { return }
//				self.coin = coin.capitalized
//				self.price = "$\(price)"
				print("DEBUG: Price in service \(price)")
				completion(price)
			
		}.resume()
	}
}

