/**
 * Created by Gev on 12/18/2014.
 */
package collage.cases {
import collage.Config;
import collage.model.ImagesModel;

import org.flexunit.Assert;

public class ImagesModelTestCase {
    private var _imagesModel:ImagesModel;

    [Before]
    public function setUp():void {
        _imagesModel = new ImagesModel();
    }

    [After]
    public function tearDown():void {
        _imagesModel = null;
    }

    [Test]
    public function testGetInitialImages():void {
        var initialImages:Array = _imagesModel.getInitialImages();
        var imagesCount:int = Config.ROW_COUNT * Config.COL_COUNT;
        Assert.assertEquals("Images count is wrong", initialImages.length, imagesCount);
    }
}
}
