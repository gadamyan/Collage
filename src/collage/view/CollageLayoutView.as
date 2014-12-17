/**
 * Created by Gev on 12/15/2014.
 */
package collage.view {
import collage.Config;

import flash.display.Bitmap;
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.utils.Dictionary;
import flash.utils.getQualifiedSuperclassName;

public class CollageLayoutView extends Sprite {

    public function showFailureMessage():void {
        var bgSprite:Sprite = new Sprite();
        bgSprite.graphics.beginFill(0xFFFFFF, 0.4);
        bgSprite.graphics.drawRect(0, 0, Config.STAGE_WIDTH, Config.STAGE_HEIGHT);
        bgSprite.graphics.endFill();
        addChild(bgSprite);
        var textField:TextField = new TextField();
        textField.text = "FAILED TO LOAD THE IMAGE";
        textField.autoSize = TextFieldAutoSize.CENTER;
        textField.x = Config.STAGE_WIDTH/ 2 - textField.width/ 2;
        textField.y = Config.STAGE_HEIGHT/ 2 - textField.height/ 2;
        addChild(textField);
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
            var collageView:IImageView = ImageViewFactory.createImageView(getQualifiedSuperclassName(CollageImageView), name, image, blockWidth, blockHeight);
            var displayObject:DisplayObject = collageView.getDisplayObject;
            displayObject.x = i * blockWidth;
            displayObject.y = j * blockHeight;
            i++;
            addChild(displayObject);
        }
    }
}
}
