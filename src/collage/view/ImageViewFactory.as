/**
 * Created by Gev on 12/17/2014.
 */
package collage.view {
import flash.display.Bitmap;
import flash.utils.getQualifiedSuperclassName;

public class ImageViewFactory {
    public static function createImageView(type:String, imageName:String, imageBitmap:Bitmap, blockWidth:Number, blockHeight:Number):IImageView {
        var imageView:IImageView = null;
        switch (type) {
            case getQualifiedSuperclassName(CollageImageView):
                imageView = new CollageImageView(imageName, imageBitmap, blockWidth, blockHeight);
                break;
            default:
                break;
        }
        return imageView;
    }
}
}
