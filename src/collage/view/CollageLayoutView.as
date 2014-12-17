/**
 * Created by Gev on 12/15/2014.
 */
package collage.view {
import collage.Config;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.text.TextField;
import flash.utils.Dictionary;
import flash.utils.getQualifiedSuperclassName;

public class CollageLayoutView extends Sprite {
    private var _textField:TextField;
    public function CollageLayoutView() {
        _textField = new TextField();
        addChild(_textField);
    }

    public function updateMessage(message:String):void {
        _textField.text = message;
    }

    public function createImages(imageMap:Dictionary):void {
        Config.STAGE_WIDTH = stage.stageWidth;
        Config.STAGE_HEIGHT = stage.stageHeight;
        var blockWidth:Number = Config.STAGE_WIDTH / Config.COL_COUNT;
        var blockHeight:Number = Config.STAGE_HEIGHT / Config.ROW_COUNT;
        var i:int = 0;
        var j:int = 0;
        for (var name:String in imageMap) {
            if (i == Config.COL_COUNT) {
                i = 0;
                j++;
            }
            var image:Bitmap = imageMap[name];
            var collageView:CollageImageView = ImageViewFactory.createImageView(getQualifiedSuperclassName(CollageImageView), name, image, blockWidth, blockHeight);
            collageView.x = i * blockWidth;
            collageView.y = j * blockHeight;
            i++;
            addChild(collageView);
        }
    }
}
}
