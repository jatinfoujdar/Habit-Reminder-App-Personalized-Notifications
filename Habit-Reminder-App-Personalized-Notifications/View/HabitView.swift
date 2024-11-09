import SwiftUI

struct HabitView: View {
    @State private var habit = ""
    @State private var reminderDate = Date()
    @State private var savedHabits: [String] = [] 

    var body: some View {
        VStack(spacing: 20) {
            Text("Habit Reminder")
                .fontWeight(.bold)
                .font(.largeTitle)
            
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
                    savedHabits.append(habit)
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
                    
                    ForEach(savedHabits, id: \.self) { habit in
                        Text("- \(habit)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.top, 20)
            }
        }
        .padding()
    }
}

#Preview {
    HabitView()
}
