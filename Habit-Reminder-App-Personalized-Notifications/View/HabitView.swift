import SwiftUI

struct HabitView: View {
    @State private var habit = ""
    @State private var reminderDate = Date()
    @State private var savedHabits: [HabitModel] = []
    
    var body: some View {
        NavigationView {
            ZStack {
               
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
               
                Circle()
                    .fill(Color.blue.opacity(0.1))
                    .frame(width: 200, height: 200)
                    .position(x: 50, y: 100)
                
                Circle()
                    .fill(Color.purple.opacity(0.1))
                    .frame(width: 150, height: 150)
                    .position(x: 300, y: 400)
                
                VStack(spacing: 20) {
                    Text("Habit Tracker")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.blue.opacity(0.8))
                        .padding(.top)
                    
                    TextField("Enter habit", text: $habit)
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(12)
                        .shadow(radius: 4)
                        .padding(.horizontal)
                    
                    DatePicker("Set Reminder Date", selection: $reminderDate, displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(CompactDatePickerStyle())
                        .padding(.horizontal)
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(8)
                        .shadow(radius: 3)
                        .padding()
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
                                .foregroundColor(Color.blue.opacity(0.7))
                            
                            ForEach(savedHabits) { habit in
                                NavigationLink(destination: HabitDetailed(habit: habit)) {
                                    VStack(alignment: .leading) {
                                        Text("- \(habit.name)")
                                            .font(.subheadline)
                                            .foregroundColor(.primary)
                                        Text("Reminder: \(habit.reminderTime, style: .time)")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                    .padding()
                                    .background(Color.white.opacity(0.8))
                                    .cornerRadius(8)
                                    .shadow(radius: 2)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.top, 20)
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    HabitView()
}
