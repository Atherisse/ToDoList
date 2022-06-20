//
//  DailyView.swift
//  ToDoList (iOS)
//
//  Created by user217621 on 6/17/22.
//

import SwiftUI

struct DailyView: View {
    
    @ObservedObject var dailyViewModel:DailyViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                List {
                    NavigationLink("General", destination: ListView())
                    //whenever the navigation link is tapped, it should be able to update dailyViewModel.daySelected value
                        .onTapGesture {
                            self.dailyViewModel.daySelected = "General"
                        }
                    NavigationLink("Monday", destination: ListView())
                        .onTapGesture {
                            self.dailyViewModel.daySelected = "Monday"
                        }
                    NavigationLink("Tuesday", destination: ListView())
                        .onTapGesture {
                            self.dailyViewModel.daySelected = "Tuesday"
                        }
                    NavigationLink("Wednesday", destination: ListView())
                        .onTapGesture {
                            self.dailyViewModel.daySelected = "Wednesday"
                        }
                    NavigationLink("Thursday", destination: ListView())
                        .onTapGesture {
                            self.dailyViewModel.daySelected = "Thursday"
                        }
                    NavigationLink("Friday", destination: ListView())
                        .onTapGesture {
                            self.dailyViewModel.daySelected = "Friday"
                        }
                    NavigationLink("Saturday", destination: ListView())
                        .onTapGesture {
                            self.dailyViewModel.daySelected = "Saturday"
                        }
                    NavigationLink("Sunday", destination: ListView())
                        .onTapGesture {
                            self.dailyViewModel.daySelected = "Sunday"
                        }
                }
            }
        }
        .navigationTitle("Choose your day")
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DailyView(dailyViewModel: DailyViewModel())
        }
        .environmentObject(ListViewModel())
    }
}
