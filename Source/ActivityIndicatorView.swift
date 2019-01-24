//
//  ActivityIndicatorView.swift
//  Komponents
//
//  Created by Sacha Durand Saint Omer on 11/05/2017.
//  Copyright © 2017 freshOS. All rights reserved.
//

import Foundation

public struct ActivityIndicatorView: Node, Equatable {
    
    public var uniqueIdentifier: Int = generateUniqueId()
    public var propsHash: Int { return props.hashValue }
    public var children = [IsNode]()
    let props: ActivityIndicatorViewProps
    public var layout: Layout
    let ref: UnsafeMutablePointer<UIActivityIndicatorView>?
    
    public init(_ activityIndicatorStyle: UIActivityIndicatorView.Style = .white,
                props:((inout ActivityIndicatorViewProps) -> Void)? = nil,
                layout: Layout? = nil,
                ref: UnsafeMutablePointer<UIActivityIndicatorView>? = nil) {
        var p = ActivityIndicatorViewProps()
        p.activityIndicatorStyle = activityIndicatorStyle
        props?(&p)
        self.props = p
        self.layout = layout ?? Layout()
        self.ref = ref
    }
}

public func == (lhs: ActivityIndicatorView, rhs: ActivityIndicatorView) -> Bool {
    return lhs.props == rhs.props
        && lhs.layout == rhs.layout
}

public struct ActivityIndicatorViewProps: HasViewProps, Equatable, Hashable {
    
    // HasViewProps
    public var backgroundColor = UIColor.white
    public var borderColor = UIColor.clear
    public var borderWidth: CGFloat = 0
    public var cornerRadius: CGFloat = 0
    public var isHidden = false
    public var alpha: CGFloat = 1
    public var clipsToBounds = false
    public var isUserInteractionEnabled = true
    
    var activityIndicatorStyle = UIActivityIndicatorView.Style.white
    
    public var hashValue: Int {
        return viewPropsHash
            ^ activityIndicatorStyle.rawValue
    }
}

public func == (lhs: ActivityIndicatorViewProps, rhs: ActivityIndicatorViewProps) -> Bool {
    return lhs.hashValue == rhs.hashValue
}
