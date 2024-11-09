//
//  HabitDetailed.swift
//  Habit-Reminder-App-Personalized-Notifications
//
//  Created by jatin foujdar on 09/11/24.
//

import SwiftUI

struct HabitDetailed: View {
    var habit: HabitModel
    var body: some View {
      
               VStack {
                   Text(habit.name)
                       .font(.largeTitle)
                       .fontWeight(.bold)
                   
                   Text("Reminder: \(habit.reminderTime, style: .time)")
                       .font(.title)
                       .foregroundColor(.gray)
                   
                   Text("Completion Streak: \(habit.completionStreak)")
                       .font(.title2)
                   
                   Text("Missed Days: \(habit.missedDays)")
                       .font(.title2)
                   
                   Spacer()
               }
               .padding()
               .navigationTitle("Habit Details")
           }
}

#Preview {
    HabitDetailed(habit: HabitModel(name: "Drink Water", reminderTime: Date(), completionStreak: 5, missedDays: 2))
}
