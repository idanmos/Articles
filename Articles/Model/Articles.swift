// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let articles = try? JSONDecoder().decode(Articles.self, from: jsonData)

import Foundation

// MARK: - Articles
class Articles: Codable {
    let data: [Datum]

    init(data: [Datum]) {
        self.data = data
    }
}

// MARK: - Datum
class Datum: Codable {
    let metaData: MetaData
    let id, title: String
    let imageURL: String
    let isSaved, isLiked: Bool
    let likesCount: Int
    let category: String
    let author: Author

    enum CodingKeys: String, CodingKey {
        case metaData, id, title
        case imageURL = "imageUrl"
        case isSaved, isLiked, likesCount, category, author
    }

    init(metaData: MetaData, id: String, title: String, imageURL: String, isSaved: Bool, isLiked: Bool, likesCount: Int, category: String, author: Author) {
        self.metaData = metaData
        self.id = id
        self.title = title
        self.imageURL = imageURL
        self.isSaved = isSaved
        self.isLiked = isLiked
        self.likesCount = likesCount
        self.category = category
        self.author = author
    }
}

// MARK: - Author
class Author: Codable {
    let id, authorName: String
    let authorAvatar: AuthorAvatar

    init(id: String, authorName: String, authorAvatar: AuthorAvatar) {
        self.id = id
        self.authorName = authorName
        self.authorAvatar = authorAvatar
    }
}

// MARK: - AuthorAvatar
class AuthorAvatar: Codable {
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case imageURL = "imageUrl"
    }

    init(imageURL: String) {
        self.imageURL = imageURL
    }
}

// MARK: - MetaData
class MetaData: Codable {
    let creationTime, updateTime: String

    init(creationTime: String, updateTime: String) {
        self.creationTime = creationTime
        self.updateTime = updateTime
    }
}
