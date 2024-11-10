import SwiftUI

struct HabitView: View {
    @State private var habit = ""
    @State private var reminderDate = Date()
    @State private var savedHabits: [HabitModel] = []
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                                
                TextField("Enter habit", text: $habit)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                DatePicker("Set Reminder Date", selection: $reminderDate, displayedComponents: [.date, .hourAndMinute])
                    .datePickerStyle(DefaultDatePickerStyle())
                    .padding(.horizontal)
                
                Button(action: {
                    if !habit.isEmpty {
                        let newHabit = HabitModel(name: habit, reminderTime: reminderDate, completionStreak: 0, missedDays: 0)
                        savedHabits.append(newHabit)
                        habit = ""
                    }
                }) {
                    Text("Save Habit")
                        .fontWeight(.semibold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                if !savedHabits.isEmpty {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Saved Habits:")
                            .font(.headline)
                        
                        ForEach(savedHabits) { habit in
                            NavigationLink(destination: HabitDetailed(habit: habit)) {
                                VStack(alignment: .leading) {
                                    Text("- \(habit.name)")
                                        .font(.subheadline)
                                    Text("Reminder: \(habit.reminderTime, style: .time)")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                .padding(.vertical, 5)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        .padding(.top, 20)
                    }
                }
                
                Spacer()
            }
            .navigationTitle("Habit Tracker")
        }
    }
}

#Preview {
    HabitView()
}
