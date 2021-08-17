//
//  ContentView.swift
//  Instagramyaho
//
//  Created by 장서우 on 2021/05/07.
//

import SwiftUI
import UIKit
import WebKit

struct ContentView: View {
    @State var userid = ""
    @State private var isOn = true
    @State var signUp: Bool = false
    /*let url = URL(string: "https://www.instagram.com/accounts/emailsignup/")*/
    
    var body: some View {
        VStack{
            Spacer()
            Text("Instagramyaho")
                .font(.largeTitle)
                .padding()
            
            //TextField("사용자 이름", text: $userid)
                //  .padding()
            
            //Text("You entered: \(userid)")
            //print("You entered: \(userid)")
            Spacer()
            HStack{
                TextField("사용자 이름",text: $userid).frame(width: 200, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding().background(RoundedRectangle(cornerRadius: 5).strokeBorder())
            }
            
            HStack{
                /*
                Toggle(isOn: $isOn){
                    Text("자동")
                }.frame(width: 90, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                */
                Button(action: { } ) {
                    Text("로그인")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 5).strokeBorder())
                        .background(Color.blue)
                }
            }.padding()
            Spacer()
            
            HStack{
                Text("계정이 없으신가요?")
            
                Button(action: {self.signUp = true} ){
                    Text("가입하기")
                    .foregroundColor(Color.blue)
                }
                /*
                if self.signUp == true {
                    var ret = 0
                    ret = linkClicked(sender: <#T##AnyObject#>)
                }*/
            }
            
            Spacer()
 
        }
    }
    
    //Method
    func linkClicked(sender: AnyObject) -> Int {
        openUrl(url: "http://fr.envisite.net/t5exce")
        return 0
    }
    func openUrl(url:String!) {

        let targetURL=NSURL(fileURLWithPath: url)
        let application=UIApplication.shared
        application.open(targetURL as URL);
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct LogInAction: View{
    @State private var isOn = true
    
    init(){
        UISwitch.appearance().onTintColor   = .gray
        UISwitch.appearance().thumbTintColor    = .white
    }
    
    var body: some View{
        HStack{
            Toggle(isOn: $isOn){
                Text("자동")
            }.frame(width: 90, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Button(action: { } ) {
                Text("로그인")
                    .frame(width: 80, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
            }
        }.padding()
    }
}

