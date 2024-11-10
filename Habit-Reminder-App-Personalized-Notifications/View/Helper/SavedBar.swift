
import SwiftUI

struct SavedBar: View {
    @Binding var savedHabits: [HabitModel]
       
       var body: some View {
           VStack {
               HStack {
                   Text("Saved Habits")
                       .font(.headline)
                       .foregroundColor(.white)
                   Spacer()
               }
               .padding()
               .background(Color.blue)
               .cornerRadius(10)
               .shadow(radius: 4)

              
               if !savedHabits.isEmpty {
                   VStack(alignment: .leading, spacing: 10) {
                       ForEach(savedHabits) { habit in
                           NavigationLink(destination: HabitDetailed(habit: habit)) {
                               VStack(alignment: .leading) {
                                   Text("- \(habit.name)")
                                       .font(.subheadline)
                                       .fontWeight(.bold)
                                       .foregroundColor(.black)
                                   Text("Reminder: \(habit.reminderTime, style: .time)")
                                       .font(.caption)
                                       .foregroundColor(.gray)
                               }
                               .padding([.top, .bottom], 15)
                               .padding([.leading, .trailing], 100)
                               .background(Color.white.opacity(0.8))
                               .cornerRadius(8)
                               .shadow(radius: 2)
                           }
                           .buttonStyle(PlainButtonStyle())
                       }
                   }
                   .padding(.top, 10)
               } else {
                   Text("No saved habits yet.")
                       .foregroundColor(.gray)
                       .padding(.top, 10)
               }
           }
           .padding(.horizontal)
       }
   }

#Preview {
    SavedBar(savedHabits: .constant([
                HabitModel(name: "Morning Run", reminderTime: Date(), completionStreak: 5, missedDays: 2),
                HabitModel(name: "Read Book", reminderTime: Date(), completionStreak: 10, missedDays: 1)
            ]))
    }

