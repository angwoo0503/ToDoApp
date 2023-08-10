

import UIKit

class ToDoListTableViewCell: UITableViewCell {
    
    var task: Task?
    
    @IBOutlet weak var taskSwitch: UISwitch!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
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
            // textLabel?.text = nil
            textLabel?.attributedText = task.title.strikeThrough()
            timeLabel.text = DateFormatter.formatTodoDate(date: task.time)
        } else {
            // textLabel?.text = task.title
            textLabel?.attributedText = task.title.removeStrikeThrough()
            timeLabel.text = DateFormatter.formatTodoDate(date: task.time)
        }
        taskSwitch.isOn = task.isCompleted
    }
    
    
    
    // add
    
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
    
    func removeStrikeThrough() -> NSAttributedString {
        let attributedString = NSAttributedString(string: self)
        let mutableAttributedString = NSMutableAttributedString(attributedString: attributedString)
        mutableAttributedString.removeAttribute(NSAttributedString.Key.strikethroughStyle, range: NSMakeRange(0, mutableAttributedString.length))
        return mutableAttributedString
    }
}


extension DateFormatter {
    static func formatTodoDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd - HH:mm"
        return formatter.string(from: date)
    }
}
