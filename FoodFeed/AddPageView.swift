//
//  AddPageView.swift
//  FoodFeed
//
//  Created by rover gutierrez on 10/11/25.
//

import SwiftUI
import PhotosUI
import FirebaseFirestore

// RJ is working on this section
struct AddPageView: View {
    @State private var name: String = ""
    @State private var expirationDate: Date = .now
    @State private var type: String = "Produce"
    @State private var amount: String = ""
    
    private let types: [String] = ["Produce", "Dairy", "Meat", "Pantry", "Frozen", "Other" ]
    
    let db = Firestore.firestore()
    
    var body: some View {
        Form {
            Section("Item Details") {
                TextField("Name", text: $name)
                DatePicker("Expiration Date", selection: $expirationDate, displayedComponents: .date)
                Picker("Type", selection: $type ) {
                    ForEach(types, id: \.self) { t in
                        Text(t).tag(t)
                    }
                }
                TextField("Amount (e.g., 2 lbs, 3 pcs)", text: $amount)
            }
            Section {
                Button(action: {
                    // Perform submission logic here
                    addItemToDatabase()
                    
                    
                }) {
                    Text("Submit")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                }
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.clear)
                .frame(maxWidth: .infinity, alignment: .center)
                .disabled(name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
    }


    //start of firebase functions
    
    //TESTING ADD
    //to test we need to change read/write permissions on firebase to true
    //this is bc we need to authenticate user first and currently we dont
    func addItemToDatabase() {
        
        //temp, its just a random number id
        let userID = "tester"
        
        let itemData: [String: Any] = [
            "itemName": name,
            "expirationDate": Timestamp(date: expirationDate),
            "quantity": amount,
            "type": [type]
        ]
        
        db.collection("users").document(userID).collection("items").addDocument(data: itemData) { error in
            if let error = error {
                print("Error adding item")
            } else {
                print("Item added")
                
                //resetting items to be blank
                name = ""
                amount = ""
                type = "Produce"
                expirationDate = .now
            }
        }
    }
}

#Preview {
    AddPageView()
}
