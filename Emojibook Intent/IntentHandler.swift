//
//  IntentHandler.swift
//  Widgets
//
//  Created by Ahmed Nasser on 15/03/2021.
//

import Foundation
import Intents

class IntentHandler: INExtension {
  override func handler(for intent: INIntent) -> Any {
    // This is the default implementation.  If you want different objects to handle different intents,
    // you can override this and return the handler you want for that particular intent.
    
    return self
  }
}

extension IntentHandler: SelectEmojiIntentHandling {
  func provideEmojiOptionsCollection(
    for intent: SelectEmojiIntent,
    with completion: @escaping (INObjectCollection<EmojiINO>?, Error?) -> Void
  ) {
    var emojiItems = [EmojiINO]()
    EmojiProvider.all().forEach { emojiDetails in
      let emojiIntentObject =
        EmojiINO(identifier: emojiDetails.id, display: "\(emojiDetails.emoji) \(emojiDetails.name)")
      emojiItems.append(emojiIntentObject)
    }
    completion(INObjectCollection(items: emojiItems), nil)
  }
}
