//
//  StorageHelper.swift
//  Runner
//
//  Created by Nguyen Ngoc Tuyen on 2/12/24.
//

import Foundation

class StorageHelper {
    static let storage = UserDefaults.init(suiteName: "group.com.example.simpleIosWidgetExample")
    
    public static func setValue(key: String, value: Any) {
        storage?.set(value, forKey: key)
    }
    
    public static func getString(key: String) -> String? {
        return storage?.string(forKey: key)
    }
}
