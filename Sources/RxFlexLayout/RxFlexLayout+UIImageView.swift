import UIKit
import RxSwift
import FlexLayout
import Kingfisher

public extension Reactive where Base: UIImageView {
    
    func asyncImageURL(
        layoutView: UIView,
        placeholder: Placeholder? = nil,
        options: KingfisherOptionsInfo? = nil,
        progressBlock: DownloadProgressBlock? = nil,
        completionHandler: ((Result<RetrieveImageResult, KingfisherError>) -> Void)? = nil
    ) -> Binder<Kingfisher.Source> {
        return .init(self.base) { (imageView: UIImageView, source: Kingfisher.Source) in
            imageView.kf.setImage(
                with: source,
                placeholder: placeholder,
                options: options,
                progressBlock: progressBlock
            ) { result in
                completionHandler?(result)
                
                imageView.flex.markDirty()
                
                layoutView.setNeedsLayout()
            }
        }
    }
    
    func asyncImageURL(
        layoutView: UIView,
        placeholder: Placeholder? = nil,
        options: KingfisherOptionsInfo? = nil,
        progressBlock: DownloadProgressBlock? = nil,
        completionHandler: ((Result<RetrieveImageResult, KingfisherError>) -> Void)? = nil
    ) -> Binder<URL?> {
        return .init(self.base) { (imageView: UIImageView, source: URL?) in
            imageView.kf.setImage(
                with: source,
                placeholder: placeholder,
                options: options,
                progressBlock: progressBlock
            ) { result in
                completionHandler?(result)
                
                imageView.flex.markDirty()
                
                layoutView.setNeedsLayout()
            }
        }
    }
}
