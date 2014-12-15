/**
 * Created by Gev on 12/15/2014.
 */
package collage.model {
import collage.event.MessageEvent;

import com.greensock.loading.ImageLoader;
import com.greensock.loading.LoaderMax;
import com.greensock.loading.display.ContentDisplay;

import flash.display.Bitmap;

import flash.utils.Dictionary;

import org.robotlegs.mvcs.Actor;
import com.greensock.events.LoaderEvent;

public class ImageLoaderModel extends Actor {
    public static var ROW_COUNT:int = 2;
    public static var COL_COUNT:int = 2;

    private var _imagesToLoad:Array;
    private var _removedImage:String;
    private var _imageMap:Dictionary;
    private var _loader:LoaderMax;
    private var _failed:Boolean;
    public function ImageLoaderModel() {
        _imageMap = new Dictionary();
        _imagesToLoad = ["img/photo1.jpg", "img/photo2.jpg", "img/photo3.jpg", "img/photo4.jpg", "img/photo5.jpg", "img/photo6.jpg", "img/photo7.jpg"];
//        _imagesToLoad = new Vector.<String>["img/photo1.jpg", "img/photo2.jpg"];
        _failed = false;
    }

    public function loadInitialImages():void {
        LoaderMax.activate([ImageLoader]);
        var urls:Array = [];
        for (var i:int = 0; i < ROW_COUNT * COL_COUNT; ++i) {
            urls.push(_imagesToLoad.shift());
        }
        _loader = LoaderMax.parse(urls, {name:"loader", onComplete:completeHandler, onChildFail:childFailHandler});
        _loader.load();
    }

    public function loadImages():void {
        LoaderMax.activate([ImageLoader]);
        var urls:Array = [];
        for (var i:int = 0; i < ROW_COUNT * COL_COUNT; ++i) {
            urls.push(_imagesToLoad.shift());
        }
        _loader = LoaderMax.parse(urls, {name:"loader", onComplete:completeHandler, onChildFail:childFailHandler});
        _loader.load();
    }

    private function completeHandler(e:LoaderEvent):void {
        if (_failed) {
            return;
        }
        for each (var contentDisplay:ContentDisplay in _loader.content) {
            _imageMap[contentDisplay.loader.url] = contentDisplay.rawContent;
        }
        var message:MessageEvent = new MessageEvent(MessageEvent.IMAGES_LOADED);
        message.imageMap = _imageMap;
        dispatch(message);
    }

    private function childFailHandler(e:LoaderEvent):void {
        if (_failed) {
            return;
        }
        _failed = true;
        var message:MessageEvent = new MessageEvent(MessageEvent.IMAGES_LOAD_FAILED);
        dispatch(message);
    }

    public function loadOtherImage(imageName:String):void {
        _imagesToLoad.push(imageName);
        var bitmap:Bitmap = _imageMap[imageName];
        delete _imageMap[imageName];
        _removedImage = imageName;
//        var loader:ImageLoader = new ImageLoader("your_image.jpg", {name:"image",
//            x:0, y:0, width:200, height:200, onComplete:onImageLoad});
    }
}
}
