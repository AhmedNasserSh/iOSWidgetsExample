//
//  EmojiWidgetView.swift
//  Emojibook WidgeExtension
//
//  Created by Ahmed Nasser on 15/03/2021.
//

import Foundation
import SwiftUI
import WidgetKit

struct EmojiWidgetView: View {
    @Environment(\.widgetFamily) var family: WidgetFamily

    let emojiDetails: EmojiDetails
    
    @ViewBuilder
      var body: some View {
        switch family {
        case .systemSmall:
          SmallEmojiWidgetView(emojiDetails: emojiDetails)
        case .systemMedium:
          MediumEmojiWidgetView(emojiDetails: emojiDetails)
        case .systemLarge:
          LargeEmojiWidgetView(emojiDetails: emojiDetails)
        @unknown default:
          EmptyView()
        }
      }
}
struct MediumEmojiWidgetView: View {
    
    let emojiDetails: EmojiDetails
    
    var body: some View {
        ZStack {
            Color(UIColor.systemIndigo)
            HStack {
                Text(emojiDetails.emoji)
                    .font(.system(size: 56))
                    .padding()
                VStack(alignment: .leading) {
                    Text(emojiDetails.name)
                        .font(.headline)
                    Text(emojiDetails.description)
                }
                .foregroundColor(.white)
                .padding([.top, .bottom, .trailing])
            }
        }
    }
}
struct LargeEmojiWidgetView: View {
    
    let emojiDetails: EmojiDetails
    
    var body: some View {
        ZStack {
            Color(UIColor.systemIndigo)
            VStack {
                Text(emojiDetails.name)
                    .bold()
                    .font(.title)
                Text(emojiDetails.emoji)
                    .font(.system(size: 60))
                    .padding()
                Text(emojiDetails.description)
                    .font(.title3)
            }
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding()
        }
    }
}
struct SmallEmojiWidgetView: View {
    
    let emojiDetails: EmojiDetails
    
    var body: some View {
        ZStack {
            Color(UIColor.systemIndigo)
            VStack {
                Text(emojiDetails.emoji)
                    .font(.system(size: 56))
                Text(emojiDetails.name)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding(.top, 5)
                    .padding([.leading, .trailing])
                    .foregroundColor(.white)
            }
        }.widgetURL(emojiDetails.url)

    }
}
struct EmojiWidgetPlaceholderView: View {
  var body: some View {
    Color(UIColor.systemIndigo)
  }
}
