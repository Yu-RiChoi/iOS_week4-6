//
//  TableViewCell.swift
//  TodoList
//
//  Created by 최유리 on 12/14/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var cellLabel: UILabel!
    @IBOutlet var dueDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func isCompletedButton(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            cellLabel.textColor = .darkGray
            cellLabel.font = .systemFont(ofSize: 16, weight: .bold)
            dueDateLabel.textColor = .orange
            dueDateLabel.font = .systemFont(ofSize: 14, weight: .medium)
            
            sender.selectedSegmentTintColor = .gray
        } else {
            cellLabel.textColor = .lightGray
            cellLabel.font = .systemFont(ofSize: 16, weight: .light)
            dueDateLabel.textColor = .lightGray
            dueDateLabel.font = .systemFont(ofSize: 12, weight: .light)
            
            sender.selectedSegmentTintColor = .orange
            sender.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
        }
    }
    
    
}
