/**
 * Created by Gev on 12/15/2014.
 */
package collage.view {
import com.greensock.TweenLite;
import com.greensock.plugins.AutoAlphaPlugin;
import com.greensock.plugins.TweenPlugin;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.MouseEvent;

public class CollageImageView extends Sprite {
    private var _imageBitmap:Bitmap;
    private var _imageName:String;

    public function CollageImageView(imageName:String, imageBitmap:Bitmap, blockWidth:Number, blockHeight:Number) {
        _imageName = imageName;
        _imageBitmap = imageBitmap;
        var sprite:Sprite = new Sprite();
        sprite.addChild(_imageBitmap);
        sprite.width = blockWidth;
        sprite.height = blockHeight;
        addEventListener(MouseEvent.CLICK, imageClickedHandler);
        addChild(sprite);
    }

    private function imageClickedHandler(event:MouseEvent):void {
        event.target.removeEventListener(event.type, arguments.callee);
        var sprite:Sprite = event.target as Sprite;
        TweenPlugin.activate([AutoAlphaPlugin]);
        function motionFinishedCallback():void {
            sprite.parent.removeChild(sprite);
        }
        TweenLite.to(sprite, 1, {autoAlpha:0, onComplete:motionFinishedCallback});
    }
}
}