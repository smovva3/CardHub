//
//  ContentView.swift
//  Exercise3_Movva_Sanjana
//
//  Created by Sanjana Movva on 9/11/23.
//

import SwiftUI

struct CardHub: View {
    
    var title: String
    
    var contents: [String]
    
    var topicIdx: Int
    
    var body: some View{
        ScrollView{
            
                VStack(alignment: .leading) {
                    ForEach(contents, id: \.self) { content in
                        Text("☆ \(content)")
                            .padding(5)
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.system(size: 18))
                        
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                }
                .frame(width: 330.0) //223
        }
        .frame(height: 230.0)
        .background(Color(red: 0.70, green: 0.76, blue: 0.78))

    }
}




struct NewBullet: View {
    
    var title: String
    
    @State private var initial = "New bullet"
    @Binding var isView: Bool
    @Binding var bulletList: [[String]]
    @Binding var topicIdx: Int
    
    

    
    var body: some View{
            
            Text("ADD BULLET")
                .font(.title)
                .bold()
                .foregroundColor(Color(red: 0.94, green: 0.40, blue: 0.10))
                .padding(26)
            
            VStack(spacing: .zero) {
                Text("\(title)")
                    .bold()
                    .font(.title2)
                    .frame(width: 330, height: 45) //48
                    .foregroundColor(.white)
                    .background(Color(red: 0.94, green: 0.40, blue: 0.10))
                
                TextField("",text: $initial)
                    .frame(width: 330.0, height: 58)
                    .background(Color(red: 0.70, green: 0.76, blue: 0.78))
                    .onTapGesture {
                        if initial == "New bullet" {
                            initial = ""
                        }
                    }
                
    
            }
            Button(action: {
                bulletList[topicIdx].append(initial)
                isView = false}) {
                HStack {
                    Spacer()
                    Text("Save")
                        .font(.title2)
                        .bold()
                    Spacer()
                }
            }
            .buttonStyle(.borderedProminent)
            .frame(width: 330.0, height: 55.0, alignment: .center)
            .buttonBorderShape(.roundedRectangle(radius: 1))
            .tint(Color(red: 0.55, green: 0.25, blue: 0.20))
            .background(Color(red: 0.55, green: 0.25, blue: 0.20))
        
        Button(action: {isView = false}) {
            HStack {
                Spacer()
                Text("Cancel")
                    .font(.title2)
                    .bold()
                Spacer()
            }
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle(radius: 1))
        .frame(width: 330.0, height: 55.0, alignment: .center)
        .tint(Color(red: 0.90, green: 0.75, blue: 0.29))
        .background(Color(red: 0.90, green: 0.75, blue: 0.29))
        
        Spacer()
        
            
        }
        
        
    }
    

struct EditCard: View {
    
    @Binding var title: String
    
    @State private var initial = "New card name"
    @Binding var topicListItems: [String]
    @Binding var topicIdx: Int
    @Binding var isView: Bool
    
    var body: some View{
        
            Text("EDIT TOPIC")
                .font(.title)
                .bold()
                .foregroundColor(Color(red: 0.94, green: 0.40, blue: 0.10))
                .padding(32)
            
            VStack(spacing: .zero) {
                Text("\(title)")
                    .bold()
                    .font(.title2)
                    .frame(width: 330, height: 45) //48
                    .foregroundColor(.white)
                    .background(Color(red: 0.94, green: 0.40, blue: 0.10))
                
                TextField("New card name",text: $initial)
                    .frame(width: 330.0, height: 58)
                    .background(Color(red: 0.70, green: 0.76, blue: 0.78))
                    .onTapGesture {
                        if initial == "New card name" {
                            initial = ""
                        }
                    }
                
            }
        
        
            Button(action: {
                topicListItems[topicIdx] = initial
               
                isView = false
                
            }) {
                HStack {
                    Spacer()
                    Text("Save")
                        .font(.title2)
                        .bold()
                    Spacer()
                }
            }
            .buttonStyle(.borderedProminent)
            .frame(width: 330.0, height: 55.0, alignment: .center)
            .buttonBorderShape(.roundedRectangle(radius: 1))
            .tint(Color(red: 0.55, green: 0.25, blue: 0.20))
            .background(Color(red: 0.55, green: 0.25, blue: 0.20))
        
        Button(action: {isView = false}) {
            HStack {
                Spacer()
                Text("Cancel")
                    .font(.title2)
                    .bold()
                Spacer()
            }
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle(radius: 1))
        .frame(width: 330.0, height: 55.0, alignment: .center)
        .tint(Color(red: 0.90, green: 0.75, blue: 0.29))
        .background(Color(red: 0.90, green: 0.75, blue: 0.29))
        
        Spacer()
            
        }
  
    }


struct ContentView: View {
    @State private var showingOptions = false
    @State private var topicIdx: Int = 0
    @State private var showingBullet = false
    @State private var editBullet = false
    @State private var newBulletText = ""
    @State private var bulletListItems: [[String]] = [["configure alerts and action sheets", "intended to be used as-is", "does not support subclassing", "inherits from UIViewController", "support text fields to the alert interface", "This is dummy"],
                                                    
    ["provides required iOS infrastructure", "window and view architecture", "event handling for multi-touch and etc", "manages interaction with system", "a lot of features incl. resource mgmnt"],
                                                    
    ["defines the behavior for common VCs", "updates the content of the view", "responding to user interactions", "resizing views and layout mgmnt", "coordinating with other objects"]]
    @State private var topicListItems: [String] = ["UIAlertController", "UIKit", "View Controller"]
    
    let icons: [UIImage] = [#imageLiteral(resourceName: "3"), #imageLiteral(resourceName: "2"), #imageLiteral(resourceName: "1")]
    
   // let topics = ["UIAlertController", "UIKit", "View Controller"]
    
    /*let vc = [["configure alerts and action sheets", "intended to be used as-is", "does not support subclassing", "inherits from UIViewController", "support text fields to the alert interface", "This is dummy"],
              
        ["provides required iOS infrastructure", "window and view architecture", "event handling for multi-touch and etc", "manages interaction with system", "a lot of features incl. resource mgmnt"],
        
        ["defines the behavior for common VCs", "updates the content of the view", "responding to user interactions", "resizing views and layout mgmnt", "coordinating with other objects"]]
    
    */
    
    var body: some View {
        VStack {
            Text("CardHub")
                .font(.title)
                .bold()
                .foregroundColor(Color(red: 0.94, green: 0.40, blue: 0.10))
                .padding(.top,38) //53
         
            
            Image( uiImage: icons[topicIdx])
                            .resizable()
                            .frame(width: 74.0, height: 74.0) //68
            VStack(spacing: .zero) {
                Text("\(topicListItems[topicIdx])")
                    .bold()
                    .font(.title2)
                    .frame(width: 330, height: 45) //48
                    .foregroundColor(.white)
                    .background(Color(red: 0.94, green: 0.40, blue: 0.10))
                
                
                CardHub(title: topicListItems[topicIdx], contents: bulletListItems[topicIdx], topicIdx: topicIdx)
            }
            //Spacer()
            
            .padding(.bottom,45) //38
            
            Button(action: nextCard) {
                HStack {
                    Spacer()
                    Text("Next card")
                        .font(.title2)
                        .bold()
                    Spacer()
                }
                        }
            .buttonStyle(.borderedProminent)
            .frame(width: 330.0, height: 55.0, alignment: .center)
            .buttonBorderShape(.roundedRectangle(radius: 1))
            .tint(Color(red: 0.94, green: 0.40, blue: 0.10))
            .background(Color(red: 0.94, green: 0.40, blue: 0.10))
            
            Button(action: cardSelector) {
                HStack {
                    Spacer()
                    Text("Card selector")
                        .font(.title2)
                        .bold()
                    Spacer()
                }
                  }
            .buttonStyle(.borderedProminent)
            .frame(width: 330.0, height: 55.0, alignment: .center)
            .buttonBorderShape(.roundedRectangle(radius: 1))
            .tint(Color(red: 0.55, green: 0.25, blue: 0.20))
            .background(Color(red: 0.55, green: 0.25, blue: 0.20))
            
            .confirmationDialog("Pick a topic",
                                isPresented: $showingOptions,
                                titleVisibility: .visible) {
                
                ForEach(topicListItems, id: \.self) { topic in
                    Button(topic) {
                        topicIdx = topicListItems.firstIndex(of: topic)!
                        cardSelector()
                    }
                }
            }
            
            Button(action: addBullet) {
                HStack {
                    Spacer()
                    Text("Add bullet")
                        .font(.title2)
                        .bold()
                        .sheet(isPresented: $showingBullet) {
                           
                            NewBullet(title: topicListItems[topicIdx], isView: $showingBullet, bulletList: $bulletListItems, topicIdx : $topicIdx)
                        }
                    Spacer()
                }
            }
            .buttonStyle(.borderedProminent)
            .frame(width: 330.0, height: 55.0, alignment: .center)
            .buttonBorderShape(.roundedRectangle(radius: 1))
            .tint(Color(red: 0.90, green: 0.75, blue: 0.29))
            .background(Color(red: 0.90, green: 0.75, blue: 0.29))
            
            
            Button(action: editCardName) {
                HStack {
                    Spacer()
                    Text("Edit card name")
                        .font(.title2)
                        .bold()
                        .sheet(isPresented: $editBullet) {
                            EditCard(title: $topicListItems[topicIdx],
                                     topicListItems: $topicListItems, topicIdx: $topicIdx, isView: $editBullet)
                        }
                    Spacer()
                }
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 1))
            .frame(width: 330.0, height: 55.0, alignment: .center)
            .tint(Color(red: 0.90, green: 0.75, blue: 0.29))
            .background(Color(red: 0.90, green: 0.75, blue: 0.29))
            
        }
        .padding()
    }
    
    
    func nextCard() {
        topicIdx = (topicIdx+1)%3
    }
    
    func cardSelector() {
        showingOptions = true
    }
    
    func addBullet() {
        showingBullet.toggle()
    }
    
    func editCardName() {
        editBullet.toggle()

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
