
import UIKit

class ToDoCompletedTableViewCell: UITableViewCell {

    var task: Task?
    
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
