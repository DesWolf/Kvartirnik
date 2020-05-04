//
//  ViewController.swift
//  Kvartirnik
//
//  Created by Максим Окунеев on 5/2/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import UIKit

//Мне стыдно за этот код, в реальной жизни я так не делаю

class NewEventVC: UITableViewController {
    
    @IBOutlet weak var eventNameTF: UITextField!
    @IBOutlet weak var descriptionTF: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var durationPicker: UIPickerView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var priceTF: UITextField!
    @IBOutlet weak var linkTF: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var newEvent: [EventModel] = []
    var categories = ["Кулинария", "Музыка","Игры", "Спорт", "Книги"]
    var duration = ["30 минут", "60 минут", "90 минут", "120 минут", "Не известно"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.date = NSDate() as Date
        dateLabel.text = toNewFormatDate(dateString: "\(datePicker.date)")
        datePicker.isHidden = true
        durationPicker.isHidden = true
        categoryPicker.isHidden = true
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func dateChanged(sender: UIDatePicker) {
        dateLabel.text = toNewFormatDate(dateString: "\(datePicker.date)")
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        
        switch categoryLabel.text {
        case "Кулинария":
            TestData.eventsCooking.append(EventModel(id: 13, category: categoryLabel.text!, eventDate: dateLabel.text!, eventOwner: "Max Okuneev", eventName: eventNameTF.text!, eventDescription: descriptionTF.text!, eventLink: linkTF.text ?? "", eventPrice: priceTF.text ?? "", eventImage: "cockingStandartImage"))
        case "Музыка":
            TestData.eventsMusic.append(EventModel(id: 13, category: categoryLabel.text!, eventDate: dateLabel.text!, eventOwner: "Max Okuneev", eventName: eventNameTF.text!, eventDescription: descriptionTF.text!, eventLink: linkTF.text ?? "", eventPrice: priceTF.text ?? "", eventImage: "musicStandatImage"))
        case "Игры":
            TestData.eventsGames.append(EventModel(id: 13, category: categoryLabel.text!, eventDate: dateLabel.text!, eventOwner: "Max Okuneev", eventName: eventNameTF.text!, eventDescription: descriptionTF.text!, eventLink: linkTF.text ?? "", eventPrice: priceTF.text ?? "", eventImage: "gamesStandartImage"))
        case "Спорт":
            TestData.eventsSport.append(EventModel(id: 13, category: categoryLabel.text!, eventDate: dateLabel.text!, eventOwner: "Max Okuneev", eventName: eventNameTF.text!, eventDescription: descriptionTF.text!, eventLink: linkTF.text ?? "", eventPrice: priceTF.text ?? "", eventImage: "sportStandartImage"))
        case "Книги":
            TestData.eventsBooks.append(EventModel(id: 13, category: categoryLabel.text!, eventDate: dateLabel.text!, eventOwner: "Max Okuneev", eventName: eventNameTF.text!, eventDescription: descriptionTF.text!, eventLink: linkTF.text ?? "", eventPrice: priceTF.text ?? "", eventImage: "booksStandartImage"))
        default:
            return
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is UINavigationController {
            let navVC = segue.destination as? UINavigationController
            let tableVC = navVC?.viewControllers.first as! DetailEventTVC
            tableVC.event = EventModel(id: 13, category: categoryLabel.text!, eventDate: dateLabel.text!, eventOwner: "Max Okuneev", eventName: eventNameTF.text!, eventDescription: descriptionTF.text!, eventLink: linkTF.text ?? "", eventPrice: priceTF.text ?? "", eventImage: "")
            TestData.myEvents.append(EventModel(id: 13, category: categoryLabel.text!, eventDate: dateLabel.text!, eventOwner: "Max Okuneev", eventName: eventNameTF.text!, eventDescription: descriptionTF.text!, eventLink: linkTF.text ?? "", eventPrice: priceTF.text ?? "", eventImage: ""))
        }
    }
}

//MARK: TableViewDelegate, TableViewDataSource
extension NewEventVC {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 2:
            return CGFloat(categoryPicker.isHidden ? 0.0 : 120.0)
        case 5:
            return CGFloat(datePicker.isHidden ? 0.0 : 216.0)
        case 7:
            return CGFloat(durationPicker.isHidden ? 0.0 : 120.0)
        default:
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let categoryIndexPath = IndexPath(row: 1, section: 0)
        let dateIndexPath = IndexPath(row: 4, section: 0)
        let durationIndexPath = IndexPath(row: 6, section: 0)
        switch indexPath {
        case categoryIndexPath:
            categoryPicker.isHidden = !categoryPicker.isHidden
            pickerAnimation(indexPath: indexPath)
        case dateIndexPath:
            datePicker.isHidden = !datePicker.isHidden
            pickerAnimation(indexPath: indexPath)
        case durationIndexPath:
            durationPicker.isHidden = !durationPicker.isHidden
            pickerAnimation(indexPath: indexPath)
        default:
            return
        }
    }
    
    func pickerAnimation(indexPath: IndexPath) {
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.tableView.beginUpdates()
            self.tableView.deselectRow(at: indexPath as IndexPath, animated: true)
            self.tableView.endUpdates()
        })
    }
}

//MARK: PickerView Delegate & DataSource
extension NewEventVC : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0:
            return categories.count
        case 1:
            return duration.count
            
        default:
            return 0
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0:
            return categories[row]
        case 1:
            return duration[row]
            
        default:
            return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0:
            return categoryLabel.text = categories[row]
        case 1:
            return durationLabel.text = duration[row]
        default:
            return
        }
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


extension NewEventVC {
    func toNewFormatDate(dateString: String) -> String{
        var result = ""
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        if let date = formatter.date(from: dateString) {
            formatter.dateFormat = "dd.MM.yy hh:mm"
            result = "\(formatter.string(from: date))"
        }
        return result
    }
    
    func standartImage(name: String)-> UIImage {
        switch name {
        case "Кулинария":
            return UIImage(named: "cockingStandartImage")!
        case "Музыка":
            return UIImage(named: "musicStandatImage")!
        case "Игры":
            return UIImage(named: "gamesStandartImage")!
        case "Спорт":
            return UIImage(named: "sportStandartImage")!
        case "Книги":
            return UIImage(named: "booksStandartImage")!
        default:
            return #imageLiteral(resourceName: "intrestingStandatImage")
        }
    }
}
