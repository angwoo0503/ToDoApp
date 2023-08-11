

import UIKit

class ToDoListTableViewCell: UITableViewCell {
    
    var task: Task?
    
    @IBOutlet weak var taskSwitch: UISwitch!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func switchChanged(_ sender: Any) {
        guard let task else {return}
        if taskSwitch.isOn {
            titleLabel.attributedText = task.title.strikeThrough()
            TaskList.completeTask(task: task, isCompleted: true)
            taskSwitch.onTintColor = UIColor(hex: "#0E62B0")
        } else {
            titleLabel.attributedText = task.title.removeStrikeThrough()
            TaskList.completeTask(task: task, isCompleted: false)
        }
    }
    
    
    func setTask(_ _task: Task) {
        task = _task
        guard let task else {return}
        
        if task.isCompleted {
            // textLabel?.text = nil
            titleLabel.attributedText = task.title.strikeThrough()
            timeLabel.text = DateFormatter.formatTodoDate(date: task.time)
            taskSwitch.onTintColor = UIColor(hex: "#0E62B0")
        } else {
            // textLabel?.text = task.title
            titleLabel.attributedText = task.title.removeStrikeThrough()
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
        formatter.dateFormat = "yyyy/MM/dd - HH:mm:ss"
        return formatter.string(from: date)
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
