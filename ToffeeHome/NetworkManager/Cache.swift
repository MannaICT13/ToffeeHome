//
//  File.swift
//  ToffeeHome
//
//  Created by Khaled on 20/8/23.
//

import Foundation

struct CBCache<Key: Hashable, Value> {
    private var cache: [Key: Value] = [:]
    private let queue = DispatchQueue(label: "com.nexdecade.cacheQueue")

    func getValue(forKey key: Key) -> Value? {
        queue.sync {
            return cache[key]
        }
    }

    mutating func setValue(_ value: Value, forKey key: Key) {
        queue.sync {
            cache[key] = value
        }
    }
}
