import SwiftUI

struct HabitDetailed: View {
    @State private var habit: HabitModel
    
    init(habit: HabitModel) {
        _habit = State(initialValue: habit)
    }
    
    var body: some View {
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
            
            VStack(spacing: 30) {
        
                Text(habit.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue.opacity(0.8))
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .shadow(radius: 4)
                
              
                VStack(spacing: 15) {
                    Text("Set Reminder:")
                        .font(.headline)
                        .foregroundColor(Color.gray)
                    
                    DatePicker("Reminder Time", selection: $habit.reminderTime, displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .accentColor(Color.blue)
                        .padding()
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.6)]), startPoint: .top, endPoint: .bottom)
                        )
                        .cornerRadius(10)
                        .shadow(radius: 3)
                    
                    Divider().padding(.vertical, 10)
                    
                    
                    HStack {
                        Text("This Streak: \(habit.completionStreak)")
                            .font(.title2)
                            .foregroundColor(Color.green.opacity(0.8))
                  
                        Spacer()
                    Text("Longest Streak: \(habit.missedDays)")
                        .font(.title2)
                        .foregroundColor(Color.red.opacity(0.8))
                    }
                }
                .padding()
                .background(Color.white.opacity(0.85))
                .cornerRadius(12)
                .shadow(radius: 5)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Habit Details")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    HabitDetailed(habit: HabitModel(name: "Drink Water", reminderTime: Date(), completionStreak: 5, missedDays: 2))
}
