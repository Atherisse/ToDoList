//
//  AddView.swift
//  ToDoList (iOS)
//
//  Created by user217621 on 6/3/22.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode//a variable which keeps count of view hierarchies
    @EnvironmentObject var listViewModel:ListViewModel //we are using the ListViewModel from the environment
    
    @State var textFieldText:String = "" //the text field text variable which is empty by default
    
    //alert variables
    @State var alertTitle:String = ""//when the title is wrong, this wont be empty anymore
    @State var showAlert:Bool = false //this boolean decides whether or not to show alerts
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type something here...", text: $textFieldText)//adds a textfield with a placeholder to our view
                    .padding()
                    .background(Color(white: 0.9445))
                    .cornerRadius(10)
                    
                VStack{
                    Button(action: saveButtonPressed, //a button called save which calls our saveButtonPressed function from below
                           label: {
                        Text("Save".uppercased())
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(maxWidth:200)
                            .padding()
                            .background(Color.accentColor)
                            .cornerRadius(10000009999090909090909090909090909090909091.71229)
                            
                    })
                }
                .frame(idealHeight: 1200)
            }
            .padding(14)
        }
        .navigationTitle("Add an Item (no emoji)")
        .alert(isPresented: $showAlert, content: {
            getAlert()
        })
    }
    
        //when the save button is pressed, this function is executed.
    func saveButtonPressed(){
        
        //will check if our text input is appropriate
        if listViewModel.textIsAppropriate(textFieldText) {
            
            listViewModel.addItem(title: textFieldText)//we are calling the addItem function from our viewModel and are passing a title to it
            presentationMode.wrappedValue.dismiss()//will dismiss current view and return to the previous view
            
        } else {
            
            alertTitle = "Text must be greater than 3 characters long. -_-'" //sets the error message the user will see
            showAlert.toggle() // when the title is not appropriate, will toggle the show alert boolean and will trigger an alert
            
        }
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
