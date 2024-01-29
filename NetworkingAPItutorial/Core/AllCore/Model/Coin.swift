//
//  Coin.swift
//  NetworkingAPItutorial
//
//  Created by Николай Гринько on 26.01.2024.
//

import Foundation

struct Coin: Codable, Identifiable {
	
	let id: String
	let symbol: String
	let name: String
	let currentPrice: Double
	let marketCapRanc: Int
	
	enum CodingKeys: String, CodingKey {
		case id, symbol, name
		case currentPrice = "current_price"
		case marketCapRanc = "market_cap_rank"
	}
	
}
