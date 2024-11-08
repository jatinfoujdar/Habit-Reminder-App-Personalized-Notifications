import Foundation


struct HabitModel : Identifiable{
        let id = UUID()
        var name: String
        var reminderTime: Date
        var completionStreak: Int
        var missedDays: Int
}

enum NotificationType {
    case basic, motivational, congratulatory
}
