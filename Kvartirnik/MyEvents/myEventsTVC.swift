//
//  HistoryTVC.swift
//  Kvartirnik
//
//  Created by Максим Окунеев on 5/2/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import UIKit

class myEventsTVC: UITableViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()
////        print(TestData.myEvents)
//        tableView.reloadData()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TestData.myEvents.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 102
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myEventsCell", for: indexPath) as! myEventsTableViewCell
        let event = TestData.myEvents[indexPath.row]
        cell.configere(with: event)

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.destination is UINavigationController {
             let navVC = segue.destination as? UINavigationController
             let detailVC = navVC?.viewControllers.first as! DetailEventTVC
            let indexPath = self.tableView.indexPathForSelectedRow
            let event = TestData.myEvents[indexPath!.row]
            detailVC.event = event
             
         }
     }
    
}
