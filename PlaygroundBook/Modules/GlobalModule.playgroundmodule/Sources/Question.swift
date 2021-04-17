//
//  Question.swift
//  GlobalModule
//
//  Created by Nicolas Proske.
//

public struct Question {
    public var searchingFor: String
    public var correctEmoji: String

    public init(searchingFor: String, correctEmoji: String) {
        self.searchingFor = searchingFor
        self.correctEmoji = correctEmoji
    }
}

/**
 
 Adds a new question to the `questions` array.
 
    - note: The `correctEmoji` parameter has to be specified directly as "image" and not in text form.
 
    - parameters:
        - searchingFor: The written form of the `correctEmoji` parameter
        - correctEmoji: The emoji matching the `searchingFor` parameter
 
 */
public func addQuestion(_ searchingFor: String, _ correctEmoji: String) {
    questions.append(Question(searchingFor: searchingFor, correctEmoji: correctEmoji))
}
