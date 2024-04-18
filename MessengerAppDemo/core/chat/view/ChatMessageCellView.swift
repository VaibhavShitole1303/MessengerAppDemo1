//
//  ChatMessageCellView.swift
//  MessengerAppDemo
//
//  Created by Neosao Services on 23/04/24.
//

import SwiftUI

struct ChatMessageCellView: View {
    let isFromCurrentUser : Bool
    var body: some View {
        HStack{
            if isFromCurrentUser{
                Spacer()
                Text("test messagetest message Bdhuabdcdsvbds vvhvnxkv ")
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.5,alignment: .trailing)
                 
            }else{
                HStack(alignment:.bottom,spacing: 8){
                    CircularProfileImageView(user: User.MOCK_USER, size: .xxSmall)
                    Text("test message Bdhuabdcdsvbds vvhvnxkv  cmvsdiugsdhj guusdcvb cbhsdiucbm cvdjkcvgsdiuvb dnd,v sdiuvgsdcv dcvb")
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray5))
                        .foregroundColor(.black)
                        .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                        .frame(maxWidth: UIScreen.main.bounds.width / 1.75,alignment: .trailing)
                    Spacer()
                }
            }
        }
        .padding(.horizontal,8)
    }
}

#Preview {
    ChatMessageCellView(isFromCurrentUser: false)
}
