//
//  CustomControl.swift
//  CustomUIControlProject
//
//  Created by Chad Rutherford on 12/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    // MARK: - Properties
    var value: Int = 1
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    var labelArray = [UILabel]()
    var startValueX: CGFloat = 8
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    func setup() {
        for component in 1 ... componentCount {
            let label = UILabel(frame: CGRect(x: startValueX, y: 0.0, width: componentDimension, height: componentDimension))
            startValueX += componentDimension + 8.0
            label.tag = component
            label.text = "★"
            if component == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            addSubview(label)
            labelArray.append(label)
        }
    }
    
    func updateValue(at touch: UITouch) {
        let touchPoint = touch.location(in: self)
        for label in labelArray {
            if label.frame.contains(touchPoint) {
                value = label.tag
                sendActions(for: [.valueChanged])
            }
        }
        
        switch value {
        case 1:
            labelArray[0].textColor = componentActiveColor
            labelArray[1].textColor = componentInactiveColor
            labelArray[2].textColor = componentInactiveColor
            labelArray[3].textColor = componentInactiveColor
            labelArray[4].textColor = componentInactiveColor
        case 2:
            labelArray[0].textColor = componentActiveColor
            labelArray[1].textColor = componentActiveColor
            labelArray[2].textColor = componentInactiveColor
            labelArray[3].textColor = componentInactiveColor
            labelArray[4].textColor = componentInactiveColor
        case 3:
            labelArray[0].textColor = componentActiveColor
            labelArray[1].textColor = componentActiveColor
            labelArray[2].textColor = componentActiveColor
            labelArray[3].textColor = componentInactiveColor
            labelArray[4].textColor = componentInactiveColor
        case 4:
            labelArray[0].textColor = componentActiveColor
            labelArray[1].textColor = componentActiveColor
            labelArray[2].textColor = componentActiveColor
            labelArray[3].textColor = componentActiveColor
            labelArray[4].textColor = componentInactiveColor
        case 5:
            labelArray[0].textColor = componentActiveColor
            labelArray[1].textColor = componentActiveColor
            labelArray[2].textColor = componentActiveColor
            labelArray[3].textColor = componentActiveColor
            labelArray[4].textColor = componentActiveColor
        default:
            break
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        sendActions(for: [.touchDown])
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchDragInside])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchUpInside])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
}

