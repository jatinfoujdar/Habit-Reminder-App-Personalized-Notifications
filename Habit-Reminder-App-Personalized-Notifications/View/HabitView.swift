//
//  HabitView.swift
//  Habit-Reminder-App-Personalized-Notifications
//
//  Created by jatin foujdar on 09/11/24.
//

import SwiftUI

struct HabitView: View {
    @State private var habit = ""
    @State private var reminderDate = Date()
    var body: some View {
        VStack(spacing: 20){
            Text("Habit Reminder")
                .fontWeight(.bold)
                .font(.largeTitle)
            TextField("Enter habit",text:  $habit)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
            
            DatePicker("Set Reminder Date", selection: $reminderDate,    displayedComponents: [.date, .hourAndMinute])
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .padding(.horizontal)
            Button(action: {
                            // Save habit logic here
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
        .padding()
        }
    }
}

#Preview {
    HabitView()
}
