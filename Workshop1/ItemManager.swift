//
//  ItemManager.swift
//  Workshop1
//
//  Created by Yucong Li on 9/4/15.
//  Copyright (c) 2015 Yucong Li. All rights reserved.
//

import Foundation
class ItemManager {
    var items = [Workshop1Item]()
    
    func archivePath() -> String? {
        if let directoryList = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true) {
            if let documentsPath = directoryList.first as? String {
                return documentsPath + "/ScavengerHuntItems4"
            }
        }
        return nil
    }
    
    func save() {
        if let theArchivePath = archivePath() {
            if !NSKeyedArchiver.archiveRootObject(items, toFile: theArchivePath) {
                assertionFailure("Could not save data to \(theArchivePath)")
            }
        } else {
            assertionFailure("Could not determine where to save file!")
        }
    }
    
    func unarchiveSavedIems() {
        if let theArchivePath = archivePath() {
            if NSFileManager.defaultManager().fileExistsAtPath(theArchivePath) {
                items = NSKeyedUnarchiver.unarchiveObjectWithFile(theArchivePath) as! [Workshop1Item]
            }
        }
    }
    
    init() {
        unarchiveSavedIems()
    }
}