//
//  SearchModel.swift
//  KREAM
//
//  Created by 송승윤 on 1/8/25.
//

import Foundation

struct SearchModel {
    private let recentSearchWordKey = "recentSearchWordKey"
    
    func loadRecentSearchWord() -> [String] {
        return  UserDefaults.standard.stringArray(forKey: recentSearchWordKey) ?? []
    }
    
    func saveSearchQuery(_ query: String) -> [String] {
        var recentSearches = loadRecentSearchWord()
        
        recentSearches.removeAll() { $0 == query }
        recentSearches.insert(query, at: 0)
        
        if recentSearches.count > 10 {
            recentSearches.removeLast()
        }
        
        UserDefaults.standard.set(recentSearches, forKey: recentSearchWordKey)
        return recentSearches
    }
    
    func clearRecentSearches() {
            UserDefaults.standard.removeObject(forKey: recentSearchWordKey)
        }
}
