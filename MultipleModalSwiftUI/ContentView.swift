//
//  ContentView.swift
//  MultipleModalSwiftUI
//
//  Created by Jake Nelson on 27/6/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FirstView()
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("First")
                }
            
            SecondView()
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Second")
                }
            
            ThirdView()
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Third")
                }
            
            FourthView()
                .tabItem {
                    Image(systemName: "4.square.fill")
                    Text("Fourth")
                }
            
            FifthView()
                .tabItem {
                    Image(systemName: "5.square.fill")
                    Text("Fifth")
                }
        }
        .font(.headline)
    }
}

struct FirstView: View {
    
    @State var showModal = false
    @State var whichModal = ""
    
    var body: some View {
        VStack{
            Text("switch statement and State initially set to ''")
            Text("\(whichModal)").hidden()
            Button(action: {
                whichModal = "first"
                self.showModal.toggle()
            }) {
                Text("First button")
            }
            
            Button(action: {
                whichModal = "second"
                self.showModal.toggle()
            }) {
                Text("Second button")
            }
        }
        .sheet(
            isPresented: $showModal,
            content: {
                switch whichModal {
                case "first":
                    Text("First modal!")
                case "second":
                    Text("Second modal!")
                default :
                    Text("Huh?!?")
                }
            }
        )
    }
}

struct SecondView: View {
    
    @State var showModal = false
    @State var whichModal = "first"
    
    var body: some View {
        VStack{
            Text("switch statement and State initially set to 'first'")
            Button(action: {
                whichModal = "first"
                self.showModal.toggle()
            }) {
                Text("First button")
            }
            Button(action: {
                whichModal = "second"
                self.showModal.toggle()
            }) {
                Text("Second button")
            }
        }
        .sheet(
            isPresented: $showModal,
            content: {
                switch whichModal {
                case "first":
                    Text("First modal!")
                case "second":
                    Text("Second modal!")
                default :
                    Text("Huh?!?")
                }
            }
        )
    }
}

struct ThirdView: View {
    
    @State var showModal = false
    @State var whichModal = "first"
    
    var body: some View {
        VStack{
            Text("if statement and State initially set to 'first'")
            Button(action: {
                whichModal = "first"
                self.showModal.toggle()
            }) {
                Text("First button")
            }
            Button(action: {
                whichModal = "second"
                self.showModal.toggle()
            }) {
                Text("Second button")
            }
        }
        .sheet(
            isPresented: $showModal,
            content: {
                if whichModal == "first" {
                    Text("First modal!")
                }
                else if whichModal == "second" {
                    Text("Second modal!")
                }
                else {
                    Text("Huh?!?")
                }
            }
        )
    }
}

struct FourthView: View {
    
    @State var showModal = false
    @State var whichModal = ""
    
    var body: some View {
        VStack{
            Text("if statement and State initially set to '', set twice on button press")
            Button(action: {
                whichModal = "second"
                whichModal = "first"
                self.showModal.toggle()
            }) {
                Text("First button")
            }
            Button(action: {
                whichModal = "first"
                whichModal = "second"
                self.showModal.toggle()
            }) {
                Text("Second button")
            }
        }
        .sheet(
            isPresented: $showModal,
            content: {
                if whichModal == "first" {
                    Text("First modal!")
                }
                else if whichModal == "second" {
                    Text("Second modal!")
                }
                else {
                    Text("Huh?!?")
                }
            }
        )
    }
}

struct FifthView: View {
    
    @State var showFirst = false
    @State var showSecond = false
    
    var body: some View {
        VStack{
            Text("Separate modals on separate elements")
            Button(action: {
                self.showFirst.toggle()
            }) {
                Text("First button")
            }
            .sheet(
                isPresented: $showFirst,
                content: {
                    Text("First modal!")
                }
            )
            
            Button(action: {
                self.showSecond.toggle()
            }) {
                Text("Second button")
            }
            .sheet(
                isPresented: $showSecond,
                content: {
                    Text("Second modal!")
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
