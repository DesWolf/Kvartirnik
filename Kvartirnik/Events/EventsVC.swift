//
//  EventsTVC.swift
//  Kvartirnik
//
//  Created by Максим Окунеев on 5/2/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import UIKit

class EventsVC: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    let categories = [CategoryModel(type: "Интересное"),
                      CategoryModel(type: "Кулинария"),
                      CategoryModel(type: "Музыка"),
                      CategoryModel(type: "Игры"),
                      CategoryModel(type: "Спорт"),
                      CategoryModel(type: "Книги")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension EventsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "eventsCell", for: indexPath) as? EventsTableViewCell else { fatalError("Unable to create tableView cell") }
        
        let category = categories[indexPath.row]
        cell.configure(with: category)
        cell.collectionView.tag = indexPath.row
        cell.collectionView.reloadData()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
}
