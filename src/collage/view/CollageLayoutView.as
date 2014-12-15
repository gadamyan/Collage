/**
 * Created by Gev on 12/15/2014.
 */
package collage.view {
import collage.model.ImageLoaderModel;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.text.TextField;
import flash.utils.Dictionary;

public class CollageLayoutView extends Sprite {
    private var _textField:TextField;
    public var STAGE_WIDTH:int;
    public var STAGE_HEIGHT:int;
    public function CollageLayoutView() {
        _textField = new TextField();
//        _simpleButton = new FlexSimpleButton();
//        _simpleButton
//        _simpleButton
//        addChild(_simpleButton);
        addChild(_textField);
    }

    public function updateMessage(message:String):void {
        _textField.text = message;
    }

    public function updateImages(imageMap:Dictionary):void {
        STAGE_WIDTH = stage.stageWidth;
        STAGE_HEIGHT = stage.stageHeight;
        var blockWidth:Number = STAGE_WIDTH / ImageLoaderModel.COL_COUNT;
        var blockHeight:Number = STAGE_HEIGHT / ImageLoaderModel.ROW_COUNT;
        var i:int = 0;
        var j:int = 0;
        for (var name:String in imageMap) {
            if (i == ImageLoaderModel.COL_COUNT) {
                i = 0;
                j++;
            }
            var image:Bitmap = imageMap[name];
            var collageView:CollageImageView = new CollageImageView(name, image, blockWidth, blockHeight);
            collageView.x = i * blockWidth;
            collageView.y = j * blockHeight;
            i++;
            addChild(collageView);
        }
    }
}
}
