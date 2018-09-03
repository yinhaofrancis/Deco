//
//  PlainItem.swift
//  Deco
//
//  Created by hao yin on 2018/9/3.
//  Copyright © 2018年 hao yin. All rights reserved.
//

import Foundation

public class PlainItem: StackItem {
    public var parent: LayoutItem?
    
    public func setParent(parent: LayoutItem) {
        self.parent = parent
    }
    
    public var width: DecoVolume = .volume(0)
    
    public var height: DecoVolume = .volume(0)
    
    public var subItem: [LayoutItem] = []
    
    public func applyFrame(frame: CGRect) {
        self.frame = frame
    }
    public var frame:CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
    public var host: Layout?
    public init(volume:DecoVolume) {
        self.width = volume
        self.height = volume
    }
    
    public init(width:DecoVolume,height:DecoVolume){
        self.width = width
        self.height = height
    }
}
