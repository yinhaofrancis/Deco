//
//  Flex.swift
//  Deco
//
//  Created by hao yin on 2018/9/2.
//  Copyright © 2018年 hao yin. All rights reserved.
//

import Foundation
import QuartzCore

public enum LayoutDirection{
    case row
    case colume
}

public protocol LayoutItem {
    var width:DecoVolume {get}
    var height:DecoVolume {get}
    var parent:LayoutItem? {get}
    func setParent(parent:LayoutItem)
    func applyFrame(frame:CGRect)
    var host:Layout? {get}
}
public protocol LayoutContainer:LayoutItem{
    associatedtype Item
    var subItem:[Item] {get}
}
public protocol Layout{
    func setFrame(frame:CGRect)
}

public indirect enum DecoVolume{
    case volume(CGFloat)
    case relate(grow:UInt,shrink:UInt)
    public var realValue:CGFloat{
        switch self {
        case let .volume(v):
            return v
        case .relate:
            return 0
        }
    }
}



