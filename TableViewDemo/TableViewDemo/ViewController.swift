//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Kai Fu Jhuang on 2022/3/12.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var DemoTableView: UITableView!
    
    @IBOutlet weak var editOrNot: UIButton!
    
   
    
    // MARK: Edit Button
    @IBAction func finishedit(_ sender: UIButton) {
        DemoTableView.allowsMultipleSelectionDuringEditing = true
//        DemoTableView.allowsSelection = true
//        DemoTableView.allowsSelectionDuringEditing = true
        if editOrNot.titleLabel?.text == "Edit" {
            DemoTableView.isEditing = true
            editOrNot.setTitle("Finish", for: .normal)
        } else if editOrNot.titleLabel?.text == "Finish" {
            DemoTableView.isEditing = false
            editOrNot.setTitle("Edit", for: .normal)
        }
        
        print ("hello")
    }
    
    
    
    var phone = ["apple","sony","samesung","小米","Nokia"]
    var words = ["A","B","C"]
    
    // section numbers
    
    func numberOfSections(in tableView: UITableView) -> Int {
//        2
        1
    }
    // how many rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        phone.count
//        10
    }
    
    // define cells in rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Demo", for: indexPath) as! DemoTableViewCell
        cell.demoLabel.text = phone[indexPath.row]
        return cell
//        switch indexPath.section {
//        case 0 :
//            cell.demoLabel.text = "Apple"
//        case 1 :
//            cell.demoLabel.text = "Ball"
//        case 2 :
//            cell.demoLabel.text = "Cat"
//        default :
//            return UITableViewCell()
//        }
        
    }
    
    // 每個row 的高度
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row == 0 {
//            return 60
//        }else {
//            return 60
//        }
//    }
    
    // Create Header
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "header \(section)"
         switch section {
            case 0 ..< words.count:
                return words[section]
             default:
                return ""
             }
        // defaultWords = Bold
    }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        words
    }
//
//     viewforheader > titleforheader
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView()
//        view.backgroundColor = UIColor.blue
//        view.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
//        return view
//    }
    
//    private func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) -> UIView? {
//        let view2 = UIView()
//        view2.backgroundColor = UIColor.orange
//        view2.frame = CGRect(x: 20, y: 20, width: 20, height: 20)
//        return view2
//    }
    
    
    
    // Create Footer
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "footer \(section)"
    }
    
    //  header height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    // footer height
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
    
    // MARK: editing cells
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            phone.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            // words.remove(at: indexPath.row)
        }
    }
    
    // stop the editing method
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        switch indexPath.row {
        case 1 :
            return false
        default :
            return true
        }
        
    }
    // move row
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let readyToMove = phone[sourceIndexPath.row]
        phone.remove(at: sourceIndexPath.row)
        phone.insert(readyToMove, at: destinationIndexPath.row)
//        let readyToMove = words[sourceIndexPath.row]
//        words.remove(at: sourceIndexPath.row)
//        words.insert(readyToMove, at: destinationIndexPath.row)
    }
    
    // restrict section movement
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section % 2 == 1 {
            return false
        }
        return true
        
    }
    
    // MARK: show delegate
    
    
    // Configuring Rows 
    @IBAction func reloadData(_ sender: UIButton) {
        DemoTableView.reloadData()
    }
    
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if DemoTableView.backgroundColor == UIColor.white {
//            DemoTableView.backgroundColor = UIColor.black
//        } else if DemoTableView.backgroundColor == UIColor.black {
//            DemoTableView.backgroundColor = UIColor.white
//        }
//    }
    
   // Responding Rows
//    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
//        phone[indexPath.row] = "\(phone[indexPath.row]) will be selected"
//        DemoTableView.reloadRows(at: [indexPath], with: .automatic)
//        print ("will be selected")
//        return indexPath
//
//    }
////
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        phone[indexPath.row] = "\(phone[indexPath.row]) is selected"
        DemoTableView.reloadRows(at: [indexPath], with: .automatic)
        print ("is selected")
        let alertController = UIAlertController(title: "Contact tapped",
                                                message: "You tapped \(phone[indexPath.row])",
        preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Ok", style: .default, handler: { action in
        tableView.deselectRow(at: indexPath, animated: true)
        })
        alertController.addAction(dismissAction)
        present(alertController, animated: true, completion: nil)
        // close the is editing method otherwise it will reload the background color at the same time
    }
//
//    // only reload can press again
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        phone[indexPath.row] = "\(phone[indexPath.row]) is not selected"
//        DemoTableView.reloadRows(at: [indexPath], with: .automatic)
//    }
//
//

    func tableView(_ tableView: UITableView, shouldBeginMultipleSelectionInteractionAt indexPath: IndexPath) -> Bool {
        if indexPath.row == 0 {
            return false
        }
        return true
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        20
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        40
    }
    
//    
//    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
//        
//    }
    
//     no highlight
//    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//
    func tableView(_ tableView: UITableView, selectionFollowsFocusForRowAt indexPath: IndexPath) -> Bool {
       true
    }
    
//    func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
//
//
//    }
//

    

    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int){
        
        let headerView: UITableViewHeaderFooterView  = view as! UITableViewHeaderFooterView
        headerView.textLabel!.textColor = UIColor.blue
        headerView.textLabel!.backgroundColor = UIColor.orange
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        
        let headerView: UITableViewHeaderFooterView  = view as! UITableViewHeaderFooterView
        headerView.textLabel!.textColor = UIColor.orange
        headerView.textLabel!.backgroundColor = UIColor.blue
    }
    
    
    func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        if indexPath.row == 1 {
            return true
        }else {
            return false
        }
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        if indexPath.row == 2 {
            return false
        }
        return true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        DemoTableView.delegate = self
        DemoTableView.dataSource = self
        
//        editOrNot.titleLabel?.text = "Edit"
        DemoTableView.backgroundColor = UIColor.white
        
//        DemoTableView.allowsMultipleSelectionDuringEditing = true

    }
    

}

