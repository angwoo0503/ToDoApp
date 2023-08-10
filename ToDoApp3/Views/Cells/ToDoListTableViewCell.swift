//
//  ToDoListTableViewCell.swift
//  ToDoApp3
//
//  Created by t2023-m0061 on 2023/08/10.
//

import UIKit

class ToDoListTableViewCell: UITableViewCell {

    var task: Task?
    
    @IBOutlet weak var taskSwitch: UISwitch!
    
    

    @IBAction func switchChanged(_ sender: Any) {
        guard let task else {return}
        if taskSwitch.isOn {
            textLabel?.text = nil
            textLabel?.attributedText = task.title.strikeThrough()
            TaskList.completeTask(task: task, isCompleted: true)
        } else {
            textLabel?.attributedText = nil
            textLabel?.text = task.title
            TaskList.completeTask(task: task, isCompleted: false)
        }
    }
    
    
    func setTask(_ _task: Task) {
        task = _task
        guard let task else {return}
        if task.isCompleted {
            textLabel?.text = nil
            textLabel?.attributedText = task.title.strikeThrough()
        } else {
            textLabel?.text = task.title
            textLabel?.attributedText = nil
        }
        taskSwitch.isOn = task.isCompleted
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(
            NSAttributedString.Key.strikethroughStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: NSRange(location: 0, length: self.count)
        )
        return attributeString
    }
}
