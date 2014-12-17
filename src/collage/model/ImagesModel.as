/**
 * Created by Gev on 12/15/2014.
 */
package collage.model {
import collage.Config;
import collage.event.ImageEvent;

import com.greensock.loading.display.ContentDisplay;

import flash.display.Bitmap;
import flash.utils.Dictionary;

import org.robotlegs.mvcs.Actor;

public class ImagesModel extends Actor {
    private var _imagesToLoad:Array;
    private var _imageMap:Dictionary;

    public function ImagesModel() {
        _imageMap = new Dictionary();
        _imagesToLoad = Config.IMAGES_TO_LOAD;
    }

    public function getInitialImages():Array {
        var urls:Array = [];
        for (var i:int = 0; i < Config.ROW_COUNT * Config.COL_COUNT; ++i) {
            urls.push(_imagesToLoad.shift());
        }
        return urls;
    }

    public function getNextImageToLoad(imageName:String):String {
        _imagesToLoad.push(imageName);
        var bitmap:Bitmap = _imageMap[imageName];
        delete _imageMap[imageName];
        return _imagesToLoad.shift();
    }

    public function initialImagesLoaded(content:Array):void {
        for each (var contentDisplay:ContentDisplay in content) {
            _imageMap[contentDisplay.loader.url] = contentDisplay.rawContent;
        }
        var message:ImageEvent = new ImageEvent(ImageEvent.IMAGES_LOADED);
        message.imageMap = _imageMap;
        dispatch(message);
    }

    public function failedToLoadImage():void {
        var message:ImageEvent = new ImageEvent(ImageEvent.IMAGE_LOAD_FAILED);
        dispatch(message);
    }

    public function imagesLoaded(prevImage:String, imageUrl:String, imageBitmap:Bitmap):void {
        var message:ImageEvent = new ImageEvent(ImageEvent.IMAGE_LOADED);
        _imageMap[imageUrl] = imageBitmap;
        message.imageMap = _imageMap;
        message.image = prevImage;
        message.newImage = imageUrl;
        dispatch(message);
    }
}
}
