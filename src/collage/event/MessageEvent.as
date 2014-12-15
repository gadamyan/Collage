/**
 * Created by Gev on 12/15/2014.
 */
package collage.event {
import flash.events.Event;
import flash.utils.Dictionary;

public class MessageEvent extends Event {
    public static const GREET:String = "GREET";
    public static const REQUEST_GREETING:String = "REQUEST_GREETING";
    public static const LOAD_IMAGES:String = "LOAD_IMAGES";
    public static const IMAGES_LOADED:String = "IMAGES_LOADED";
    public static const IMAGES_LOAD_FAILED:String = "IMAGES_LOAD_FAILED";
    public static const IMAGE_REMOVED:String = "IMAGE_REMOVED";
    public static const IMAGE_ADDED:String = "IMAGE_ADDED";
    private var _image:String;
    private var _newImage:String;
    private var _message:String;
    private var _imageMap:Dictionary;

    public function MessageEvent(type:String) {
        super(type);
    }

    public function get message():String {
        return _message;
    }

    public function set message(value:String):void {
        _message = value;
    }

    public function get imageMap():Dictionary {
        return _imageMap;
    }

    public function set imageMap(value:Dictionary):void {
        _imageMap = value;
    }

    public function get image():String {
        return _image;
    }

    public function set image(value:String):void {
        _image = value;
    }

    public function get newImage():String {
        return _newImage;
    }

    public function set newImage(value:String):void {
        _newImage = value;
    }
}
}
