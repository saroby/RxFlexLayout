import UIKit
import FlexLayout
import RxSwift

public extension Reactive where Base: UITextView {
    
    func text(layoutView: UIView, sizeToFit: Bool = false) -> Binder<String?> {
        return .init(self.base) { label, text in
            label.text = text
            label.flex.markDirty()
            
            if sizeToFit {
                label.sizeToFit()
            }
            
            layoutView.setNeedsLayout()
        }
    }
    
    func attributedText(layoutView: UIView, sizeToFit: Bool = false) -> Binder<NSAttributedString?> {
        return .init(self.base) { label, attributedText in
            label.attributedText = attributedText
            label.flex.markDirty()
            
            if sizeToFit {
                label.sizeToFit()
            }
            
            layoutView.setNeedsLayout()
        }
    }
    
    func font(layoutView: UIView) -> Binder<UIFont?> {
        return .init(self.base) { label, text in
            label.font = text
            label.flex.markDirty()
            
            layoutView.setNeedsLayout()
        }
    }
    
}
