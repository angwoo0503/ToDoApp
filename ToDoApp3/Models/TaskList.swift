import Foundation

struct TaskList {
    static var list: [Task] = [
        Task(id: 0, title: "빨래 하기", isCompleted: false, time: Date()),
        Task(id: 1, title: "Swift 공부 하기", isCompleted: true, time: Date())
    ]
    
    static func completeList() -> [Task] {
        return list.filter{ $0.isCompleted == true }
    }
    
    static func completeTask(task: Task, isCompleted: Bool) {
        for index in 0 ..< list.count {
            if list[index].id == task.id {
                list[index].isCompleted = isCompleted
            }
        }
    }
    
    static func editTask(task: Task, title: String, time: Date) {
        for index in 0 ..< list.count {
            if list[index].id == task.id {
                list[index].title = title
                list[index].time = time
            }
        }
    }
    
    static func deleteTask(task: Task) {
        list.removeAll(where: {$0.id == task.id})
    }
}
