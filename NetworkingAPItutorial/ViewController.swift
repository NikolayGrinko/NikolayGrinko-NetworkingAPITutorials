//
//  ViewController.swift
//  NetworkingAPItutorial
//
//  Created by Николай Гринько on 25.01.2024.
//

import UIKit

class ViewController: UIViewController {
	 var coins = [Coin]()
	private let service = CoinDataService()
	
	
	let coinsData = CoinsViewModel()
	
	@IBOutlet weak var tableView: UITableView!
	
	let identifier = "MyCell"
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		view.addSubview(tableView)
		tableView.frame = view.bounds
		
		
//		tableView.delegate = self
//		tableView.dataSource = self
	}


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		coins.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
		cell.backgroundColor = .gray
		return cell
	}
}
