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
    
    func display(layoutView: UIView) -> Binder<Flex.Display> {
        return .init(self.base) { view, display in
            view.flex.display(display)
            view.flex.markDirty()
            
            layoutView.setNeedsLayout()
        }
    }
    
}

public extension Reactive where Base: UIView {
    
    func isHidden(layoutHandler: @escaping (() -> Void)) -> Binder<Bool> {
        return .init(self.base) { view, isHidden in
            view.flex.display(isHidden ? .none : .flex)
            view.flex.markDirty()
            
            layoutHandler()
        }
    }
    
    func isShown(layoutHandler: @escaping (() -> Void)) -> Binder<Bool> {
        return .init(self.base) { view, isShown in
            view.flex.display(isShown ? .flex : .none)
            view.flex.markDirty()
            
            layoutHandler()
        }
    }
    
    func display(layoutHandler: @escaping (() -> Void)) -> Binder<Flex.Display> {
        return .init(self.base) { view, display in
            view.flex.display(display)
            view.flex.markDirty()
            
            layoutHandler()
        }
    }
    
}
