//
//  Stack.swift
//  Deco
//
//  Created by hao yin on 2018/9/2.
//  Copyright © 2018年 hao yin. All rights reserved.
//

import Foundation

public protocol StackItem:LayoutItem {
    func volume(layout:StackLayout)->DecoVolume
}
extension StackItem{
    public func volume(layout: StackLayout) -> DecoVolume {
        switch layout.direction {
        case .row:
            return self.height
        case .colume:
            return self.width
        }
    }
}

public class StackLayout:StackItem,LayoutContainer{
    
    public typealias Item = StackItem
    
    public var subItem: [StackItem] = []{
        didSet{
            self.subItem.forEach { (i) in
                i.setParent(parent: self)
            }
        }
    }
    
    public var parent: LayoutItem?
    
    public func setParent(parent: LayoutItem) {
        self.parent = parent
    }

    public var host: Layout?
    
    public var width: DecoVolume = DecoVolume.volume(0)
    
    public var height: DecoVolume = DecoVolume.volume(0)
    
    public func applyFrame(frame: CGRect) {
        self.host?.setFrame(frame: frame)
    }

    public var direction:LayoutDirection = .row
    
    public func layout(){
        var start:CGFloat = 0
        for i in self.subItem {
            switch self.direction{
            case .row:
                i.applyFrame(frame: CGRect(x: 0, y: start, width: self.width.realValue, height: i.volume(layout: self).realValue))
                start += i.volume(layout: self).realValue
            case .colume:
                i.applyFrame(frame: CGRect(x: start, y: 0, width: i.volume(layout: self).realValue, height: self.height.realValue))
                start += i.volume(layout: self).realValue
            }
        }
    }

}
