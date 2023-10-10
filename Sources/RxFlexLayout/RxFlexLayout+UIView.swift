import UIKit
import FlexLayout
import RxSwift

public extension Reactive where Base: UIView {
    
    func isHidden(layoutView: UIView) -> Binder<Bool> {
        return .init(self.base) { view, isHidden in
            view.flex.display(isHidden ? .none : .flex)
            view.flex.markDirty()
            
            layoutView.setNeedsLayout()
        }
    }
    
    func isShown(layoutView: UIView) -> Binder<Bool> {
        return .init(self.base) { view, isShown in
            view.flex.display(isShown ? .flex : .none)
            view.flex.markDirty()
            
            layoutView.setNeedsLayout()
        }
    }
    
}
