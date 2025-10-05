//
//  ContentView.swift
//  FoodFeed
//
//  Created by Ellie on 10/4/25.
//

import SwiftUI

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
                if currentPage != "SocialPage" && currentPage != "NotifsPage" {
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
                    } else if currentPage == "SocialPage" {
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
            
            .navigationDestination(for: String.self) { value in if value == "AddPage" {
                AddPageView()
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

struct RecipePageView: View {
    var body: some View {
        VStack {
            Text("...Recipe Page")
                .font(.title)
            Spacer()
        }
    }
}

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

struct AddPageView: View {
    var body: some View {
        VStack {
            Text("...Add Page")
                .font(.title)
            Spacer()
        }
    }
}


#Preview {
    ContentView()
}
