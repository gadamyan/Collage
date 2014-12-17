/**
 * Created by Gev on 12/17/2014.
 */
package collage.service {
import collage.model.ImagesModel;

import com.greensock.events.LoaderEvent;
import com.greensock.loading.ImageLoader;
import com.greensock.loading.LoaderMax;

import org.robotlegs.mvcs.Actor;

public class ImageLoaderService extends Actor {
    [Inject] public var _imagesModel:ImagesModel;
    private var _failed:Boolean;

    public function ImageLoaderService() {
        _failed = false;
    }

    public function loadInitialImages():void {
        LoaderMax.activate([ImageLoader]);
        var urls:Array = _imagesModel.getInitialImages();
        var loader:LoaderMax = LoaderMax.parse(urls, {name:"loader", onComplete:imagesLoadedCallback, onChildFail:imageFailedCallback});
        loader.load();
    }

    private function imagesLoadedCallback(event:LoaderEvent):void {
        if (_failed) {
            return;
        }
        var loader:LoaderMax = event.target as LoaderMax;
        _imagesModel.initialImagesLoaded(loader.content);
    }

    private function imageFailedCallback(event:LoaderEvent):void {
        if (_failed) {
            return;
        }
        _failed = true;
        _imagesModel.failedToLoadImage();
    }

    public function loadImage(imageName:String):void {
        var imageToLoad:String = _imagesModel.getNextImageToLoad(imageName);
        var loader:ImageLoader = new ImageLoader(imageToLoad, {noCache:true, name: "image", prevImage: imageName, onComplete:imageLoadedCallback, onFail:imageFailedCallback});
        loader.load();
    }

    private function imageLoadedCallback(event:LoaderEvent):void {
        if (_failed) {
            return;
        }
        var loader:ImageLoader = event.target as ImageLoader;
        _imagesModel.imagesLoaded(loader.vars.prevImage, loader.url, loader.rawContent);
    }
}
}
