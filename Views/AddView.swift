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
    }
    
        //when the save button is pressed, this function is executed.
    func saveButtonPressed(){
        //we are calling the addItem function from our viewModel
        //and are passing a title to it
        listViewModel.addItem(title: textFieldText)
        presentationMode.wrappedValue.dismiss()//will dismiss current view and return to the previous view
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
