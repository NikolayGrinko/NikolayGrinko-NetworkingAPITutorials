//
//  ViewController.swift
//  NetworkingAPItutorial
//
//  Created by Николай Гринько on 25.01.2024.
//

import UIKit

class ViewController: UIViewController {

	var appStart = CoinsViewModel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		
		appStart.fetchPrice(coin: "bitcoin")
		appStart.fetchPrice(coin: "litecoin")
		
		
		
		//startApp()
	}

//	func startApp() {
//		let vc = CoinsViewModel()
//		vc.fetchPrice()
//	
//	}
}

