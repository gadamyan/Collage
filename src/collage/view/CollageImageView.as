/**
 * Created by Gev on 12/15/2014.
 */
package collage.view {
import collage.event.ImageEvent;

import com.greensock.TweenLite;
import com.greensock.layout.AutoFitArea;
import com.greensock.plugins.AutoAlphaPlugin;
import com.greensock.plugins.TweenPlugin;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.MouseEvent;

public class CollageImageView extends Sprite {
    private var _imageBitmap:Bitmap;
    private var _imageName:String;
    private var _sprite:Sprite;
    private var _isFading:Boolean;
    private var _autoFitArea:AutoFitArea;

    public function CollageImageView(imageName:String, imageBitmap:Bitmap, blockWidth:Number, blockHeight:Number) {
        _imageName = imageName;
        _imageBitmap = imageBitmap;
        _isFading = false;
        _sprite = new Sprite();
        _sprite.addChild(_imageBitmap);
        addEventListener(MouseEvent.CLICK, imageClickedHandler);
        addChild(_sprite);
        _autoFitArea = new AutoFitArea(this, 0, 0, blockWidth, blockHeight);
        _autoFitArea.attach(_sprite);
    }

    private function imageClickedHandler(event:MouseEvent):void {
        if (_isFading) {
            return;
        }
        _isFading = true;
        function motionFinishedCallback():void {
            _sprite.removeChild(_imageBitmap);
            _imageBitmap = null;
            var messageEvent:ImageEvent = new ImageEvent(ImageEvent.IMAGE_REMOVED);
            messageEvent.image = _imageName;
            dispatchEvent(messageEvent);
        }
        TweenLite.to(_sprite, 1, {alpha:0, onComplete:motionFinishedCallback});
    }

    public function updateImage(image:String, newImage:String, bitmap:Bitmap):void {
        if (_imageName == image) {
            _imageName = newImage;
            _imageBitmap = bitmap;
            _sprite.addChild(_imageBitmap);
            _autoFitArea.update();
            TweenLite.to(_sprite, 1, {alpha: 1.0});
            _isFading = false;
        }
    }
}
}