//
//  Log.swift
//  ArkCovid
//
//  Created by irem TOSUN on 7.06.2022.
//
import Foundation
import os.log

public struct Log {
    public static var general = OSLog(subsystem: "com.iremtosun.newsApp.Mobilium", category: "general")
    public static var network = OSLog(subsystem: "com.iremtosun.newsApp.Mobilium", category: "network")
    public static var data = OSLog(subsystem: "com.iremtosun.newsApp.Mobilium", category: "data")
}
