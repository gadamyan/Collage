/**
 * Created by Gev on 12/15/2014.
 */
package collage.controller {
import collage.model.ImageLoaderModel;

import org.robotlegs.mvcs.Command;

public class LoadImagesCommand extends Command {
    [Inject]
    public var _imageLoaderModel:ImageLoaderModel;
    override public function execute():void {
        _imageLoaderModel.loadInitialImages();
    }
}
}
