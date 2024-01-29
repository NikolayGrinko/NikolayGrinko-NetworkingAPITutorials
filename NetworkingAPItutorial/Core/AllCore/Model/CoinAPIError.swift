//
//  CoinAPIError.swift
//  NetworkingAPItutorial
//
//  Created by Николай Гринько on 26.01.2024.
//

import Foundation


enum CoinAPIError: Error {
	
	case invalidData
	case jsonParsingFailure
	case requestFailed(description: String)
	case invalidStatusCode(statusCode: Int)
	case unknownError(error: Error)
	
	var customDescription: String {
		
		switch self {
				
			case .invalidData: return "InvalidData"
			case .jsonParsingFailure: return "JsonParsingFailure"
			case let .requestFailed(description): return "RequestFailed \(description)"
			case let .invalidStatusCode(statusCode): return "Invalid StatusCode: \(statusCode)"
			case let .unknownError(error): return "An unknown error occured \(error.localizedDescription)"
				
		}
		
	}
	
}
