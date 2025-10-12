//
//  ContentView.swift
//  FoodFeed
//
//  Created by Ellie on 10/4/25.
//

import SwiftUI
import PhotosUI

struct PressableImageButtonStyle: ButtonStyle {
    var normalImageName: String
    var pressedImageName: String
    
    func makeBody(configuration: Configuration) -> some View {
        Image(configuration.isPressed ? pressedImageName : normalImageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50)
            .contentShape(Rectangle())
    }
}

struct AddButtonView: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            EmptyView()
        }
        .buttonStyle(PressableImageButtonStyle(
            normalImageName: "add_temp",
            pressedImageName: "add_temp"
        ))
    }
}



struct SortButtonView: View {
    var body: some View {
        Button(action: {
            print("The sort button was pressed!")
        }) {
            EmptyView()
        }
        .buttonStyle(PressableImageButtonStyle(
            normalImageName: "sort_temp",
            pressedImageName: "sort_temp_pressed"
        ))
    }
}

struct SearchButtonView: View {
    var body: some View {
        Button(action: {
            print("The search button was pressed!")
        }) {
            EmptyView()
        }
        .buttonStyle(PressableImageButtonStyle(
            normalImageName: "search_temp",
            pressedImageName: "search_temp"
        ))
    }
}

//add button for recipe page
struct RecipeAddButtonView: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            EmptyView()
        }
        .buttonStyle(PressableImageButtonStyle(
            normalImageName: "add_temp",
            pressedImageName: "add_temp"
        ))
    }
}

//sort button for recipe page
struct RecipeSortButtonView: View {
    var action: () -> Void
    var body: some View {
        Button(action:action){
            EmptyView()
        }
        .buttonStyle(PressableImageButtonStyle(
            normalImageName: "sort_temp",
            pressedImageName: "sort_temp_pressed"
        ))
    }
}

//search button for recipe page
struct RecipeSearchButtonView: View {
    var action: () -> Void
    var body: some View {
        Button(action:action) {
            EmptyView()
        }
        .buttonStyle(PressableImageButtonStyle(
            normalImageName: "search_temp",
            pressedImageName: "search_temp"
        ))
    }
}

//bottom bar navigation buttons
struct InventoryButtonView: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            EmptyView()
        }
        .buttonStyle(PressableImageButtonStyle(
            normalImageName: "inventory_temp",
            pressedImageName: "inventory_temp"
        ))
    }
}

struct RecipeButtonView: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            EmptyView()
        }
        .buttonStyle(PressableImageButtonStyle(
            normalImageName: "recipe_temp",
            pressedImageName: "recipe_temp"
        ))
    }
}

struct SocialButtonView: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            EmptyView()
        }
        .buttonStyle(PressableImageButtonStyle(
            normalImageName: "social_temp",
            pressedImageName: "social_temp"
        ))
    }
}

struct NotifButtonView: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            EmptyView()
        }
        .buttonStyle(PressableImageButtonStyle(
            normalImageName: "notifs_temp",
            pressedImageName: "notifs_temp"
        ))
    }
}

struct ContentView: View {
    @State private var currentPage: String = "InventoryPage"
    let shelfBrown = Color(red: 196/255, green: 150/255, blue: 69/255)
    
    var body: some View {
            VStack(spacing: 0) {
                //making a specific add button for recipes since it has different functions
                //buttons are reestablished whenever it enters every page becuase add/sort/search have different
                //functionalities in every navigation tab
                //recipe functionality
                if currentPage == "RecipePage"{
                    HStack(spacing: 100) {
                        RecipeAddButtonView {
                            currentPage = "RecipeAddButton"
                            
                        }
                        RecipeSortButtonView {
                            currentPage = "RecipeSortButton"
                        }
                        RecipeSearchButtonView {
                            currentPage = "RecipeSearchButton"
                        }
                    }
                    .padding()
                    .background(
                        shelfBrown.opacity(0.9)
                            .cornerRadius(12)
                    )
                    .padding(.top)
                }else if currentPage == "RecipeAddButton"{
                    HStack(spacing: 100) {
                        RecipeAddButtonView {
                            currentPage = "RecipeAddButton"
                            
                        }
                        RecipeSortButtonView {
                            currentPage = "RecipeSortButton"
                        }
                        RecipeSearchButtonView {
                            currentPage = "RecipeSearchButton"
                        }
                    }
                    .padding()
                    .background(
                        shelfBrown.opacity(0.9)
                            .cornerRadius(12)
                    )
                    .padding(.top)
                }else if currentPage == "RecipeSortButton"{
                    HStack(spacing: 100) {
                        RecipeAddButtonView {
                            currentPage = "RecipeAddButton"
                            
                        }
                        RecipeSortButtonView {
                            currentPage = "RecipeSortButton"
                        }
                        RecipeSearchButtonView {
                            currentPage = "RecipeSearchButton"
                        }
                    }
                    .padding()
                    .background(
                        shelfBrown.opacity(0.9)
                            .cornerRadius(12)
                    )
                    .padding(.top)
                }else if currentPage == "RecipeSearchButton"{
                    HStack(spacing: 100) {
                        RecipeAddButtonView {
                            currentPage = "RecipeAddButton"
                            
                        }
                        RecipeSortButtonView {
                            currentPage = "RecipeSortButton"
                        }
                        RecipeSearchButtonView {
                            currentPage = "RecipeSearchButton"
                        }
                    }
                    .padding()
                    .background(
                        shelfBrown.opacity(0.9)
                            .cornerRadius(12)
                    )
                    .padding(.top)
                }else if currentPage != "SocialPage" && currentPage != "NotifsPage" {
                    HStack(spacing: 100) {
                        AddButtonView {
                            currentPage = "AddPage"
                        }
                        SortButtonView()
                        SearchButtonView()
                    }
                    .padding()
                    .background(
                        shelfBrown.opacity(0.9)
                            .cornerRadius(12)
                    )
                    .padding(.top)
                }
                
                Spacer()
                
                Group {
                    if currentPage == "InventoryPage" {
                        InventoryPageView()
                    } else if currentPage == "AddPage" {
                        AddPageView()
                    } else if currentPage == "RecipePage" {
                        RecipePageView()
                    }else if currentPage == "RecipeAddButton"{
                        RecipeAddPageView()
                    }else if currentPage == "RecipeSortButton"{
                        RecipeSortPageView()
                    }else if currentPage == "RecipeSearchButton"{
                        RecipeSearchPageView()
                    }else if currentPage == "SocialPage" {
                        SocialPageView()
                    } else if currentPage == "NotifsPage" {
                        NotifsPageView()
                    }
                }
                
                Spacer()
                
                HStack(spacing: 50) {
                    InventoryButtonView {
                        currentPage = "InventoryPage"
                    }
                    RecipeButtonView {
                        currentPage = "RecipePage"
                    }
                    SocialButtonView {
                        currentPage = "SocialPage"
                    }
                    NotifButtonView {
                        currentPage = "NotifsPage"
                    }
                }
                
                .padding()
                .background(
                    shelfBrown.opacity(0.9)
                        .cornerRadius(12)
                )
                .padding(.bottom)
            }
            
            .navigationDestination(for: String.self) {value in
                if value == "AddPage" {
                AddPageView()
                }else if value == "RecipeAddButton"{
                    RecipeAddPageView()
                }
                else if value == "RecipeSortButton"{
                    RecipeSortPageView()
                }
                else if value == "RecipeSearchButton"{
                    RecipeSearchPageView()
                }
            }
        }
}

struct InventoryPageView: View {
    var body: some View {
        VStack {
            Text("...Inventory Page")
                .font(.title)
            Spacer()
        }
    }
}

//recipe section start

struct RecipePageView: View {
    var body: some View {
        VStack {
            Text("...Recipe Page")
                .font(.title)
            Spacer()
        }
    }
}

struct RecipeAddPageView: View {
    @State private var urlOrOwn: Bool = false
    @State private var link: String = ""
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var cookTime: String = ""
    @State private var totalTime: String = ""
    @State private var servingSize = 0
    @State private var ingredients: String = ""
    @State private var steps: String = ""
    @State private var nutrition: String = ""
    @State private var notes: String = ""
    @State private var privateOrPublic: Bool = false
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    
    
    var body: some View {
        Form {
            HStack{
                Spacer().frame(width: 100)
                Toggle("", isOn: $urlOrOwn) .labelsHidden()
                Spacer().frame(width: 40)
                    if urlOrOwn == false {
                        Text("URL Input")
                            .foregroundColor(.blue)
                    } else {
                        Text("Recipe Input")
                            .foregroundColor(.red)
                    }
                }
            if urlOrOwn == false{
                Section("URL Details"){
                    
                    
                    TextField("Link", text: $link)
                }
            }
            else{
                Section("Recipe Details") {
                    //url import or own
                    TextField("Title", text: $title)
                    
                    //picking image
                    PhotosPicker(selection: $selectedItem, matching: .images) {
                        Text("Select Image")
                    }
                    
                    //displaying image but it doesnt display rn :/
                    //TODO make this display
                    if let selectedImage {
                        selectedImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    }
                    TextField("Author", text: $author)
                    TextField("Cook Time", text: $cookTime)
                    TextField("Total Time", text: $totalTime)
                    
                    //spinning wheel 1-25. TODO: Should i increase limit?
                    Picker("Select Serving Size", selection: $servingSize ) {
                        ForEach(1..<26) { number in Text("\(number)").tag(number)}
                    }
                    //TODO make ingredients/steps/notes bullet points?
                    TextField("Ingredients", text: $ingredients)
                    TextField("Steps", text: $steps)
                    TextField("Nutrition", text: $nutrition)
                    TextField("Notes", text: $notes)
                }
            }

            //button and publish side by side
            HStack(spacing:16) {
                Button(action: {
                    // Perform submission logic here
                }) {
                    Text("Publish")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                }
                
                
                
                Spacer().frame(width:70)
                //hstack inside hstack so i can put toggle switch in the middle and text on right
                HStack{
                    Toggle("", isOn: $privateOrPublic) .labelsHidden()
                    Spacer()
                        if privateOrPublic == false {
                            Text("Private")
                                .foregroundColor(.red)
                        } else {
                            Text("Public")
                                .foregroundColor(.green)
                        }
                    }
                }
                
            }
            
        }
    
    }


struct RecipeSortPageView: View {
    var body: some View {
        VStack {
            Text("...Recipe Sort Pop up")
                .font(.title)
            Spacer()
        }
    }
}

struct RecipeSearchPageView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationStack {
            
            
            List {
                ForEach(filteredItems, id: \.self) { item in Text(item)}
            }
            .searchable(text: $searchText)
            
            
        }
    }
    var filteredItems: [String] {
        //this is a temporary array to test
        //TODO sprint 3: return array of recipes
        return ["Turturkeykey", "Cereal", "Pimento Cheese Sandwich"].filter { $0.localizedStandardContains(searchText) }
        
    }
}
//recipe section end

struct SocialPageView: View {
    var body: some View {
        VStack {
            Text("...Social Page")
                .font(.title)
            Spacer()
        }
    }
}

struct NotifsPageView: View {
    var body: some View {
        VStack {
            Text("...Notifications Page")
                .font(.title)
            Spacer()
        }
    }
}

// RJ is working on this section
struct AddPageView: View {
    @State private var name: String = ""
    @State private var expirationDate: Date = .now
    @State private var type: String = "Produce"
    @State private var amount: String = ""
    
    private let types: [String] = ["Produce", "Dairy", "Meat", "Pantry", "Frozen", "Other" ]
    
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
        .navigationTitle("Add Item")
    }
}


#Preview {
    ContentView()
}
