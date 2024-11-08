import UIKit
import RxSwift
import FlexLayout
import Kingfisher

@MainActor
public extension Reactive where Base: UIImageView {
    
    func asyncImageURL(
        layoutView: UIView,
        placeholder: Placeholder? = nil,
        options: KingfisherOptionsInfo? = nil,
        progressBlock: DownloadProgressBlock? = nil,
        completionHandler: ((Result<RetrieveImageResult, KingfisherError>) -> Void)? = nil
    ) -> Binder<Kingfisher.Source> {
        return .init(self.base) { [weak layoutView] (imageView: UIImageView, source: Kingfisher.Source) in
            imageView.kf.setImage(
                with: source,
                placeholder: placeholder,
                options: options,
                progressBlock: progressBlock
            ) { result in
                completionHandler?(result)
                
                imageView.flex.markDirty()
                
                layoutView?.setNeedsLayout()
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
        return .init(self.base) { [weak layoutView] (imageView: UIImageView, source: URL?) in
            imageView.kf.setImage(
                with: source,
                placeholder: placeholder,
                options: options,
                progressBlock: progressBlock
            ) { result in
                completionHandler?(result)
                
                imageView.flex.markDirty()
                
                layoutView?.setNeedsLayout()
            }
        }
    }
}

@MainActor
public extension Reactive where Base: UIImageView {
    
    func asyncImageURL(
        layoutHandler: @escaping (() -> Void),
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
                
                layoutHandler()
            }
        }
    }
    
    func asyncImageURL(
        layoutHandler: @escaping (() -> Void),
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
                
                layoutHandler()
            }
        }
    }
}
