//
//  InBoxView.swift
//  MessengerAppDemo
//
//  Created by Neosao Services on 18/04/24.
//

import SwiftUI

struct InBoxView: View {
    @State private var showNewMesageView = false
    @State private var user = User.MOCK_USER
    var body: some View {
        NavigationStack{
            ScrollView{
                ActiveNowView()
                List{
                    ForEach( 0 ... 10 ,id: \.self){message in
                        InBoxRowView()
                    }
                }
                .listStyle(PlainListStyle())
                .frame(height: UIScreen.main.bounds.height - 120)
            }
            .navigationDestination(for: User.self, destination: {user in
                ProfileView(user: user)
                
            })
            .fullScreenCover(isPresented: $showNewMesageView, content: {
                NewMessageView()
            })
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    HStack{
                        NavigationLink(value: user){
                            CircularProfileImageView(user: user, size: .small)
                        }
                        Text("Chat")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        showNewMesageView.toggle()
                    }label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 32,height: 32)
                            .foregroundStyle(.black,Color(.systemGray5))
                    }
                }
            }
        }
    }
}

#Preview {
    InBoxView()
}
