//
//  ChatView.swift
//  MessengerAppDemo
//
//  Created by Neosao Services on 23/04/24.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    let user :User
    var body: some View {
        VStack {
            ScrollView{
                // header
                VStack{
                    CircularProfileImageView(user: user, size: .large)
                    VStack(spacing: 4) {
                        Text(user.fullname)
                            .font(.title3)
                        .fontWeight(.semibold)
                        Text("messages")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                    }
                   
                }
                // messages
                ForEach(0 ... 15 , id: \.self){
                    message in
                    ChatMessageCellView(isFromCurrentUser: Bool.random())
                }
                
              
            }
            // message input view
            Spacer()
            ZStack(alignment:.trailing){
                TextField("messages... ",text: $messageText,axis: .vertical)
                    .padding(12)
                    .padding(.trailing,48)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(.capsule)
                    .font(.subheadline)
                
                Button{}label: {
                    Text("send")
                        .fontWeight(.semibold)
                     
                }
                .padding(.horizontal)
            }
            .padding()
        }
    }
}

#Preview {
    ChatView(user: User.MOCK_USER)
}
