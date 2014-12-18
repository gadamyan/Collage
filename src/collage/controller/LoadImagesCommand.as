/**
 * Created by Gev on 12/15/2014.
 */
package collage.controller {
import collage.service.ImageLoaderService;

import org.robotlegs.mvcs.Command;

public class LoadImagesCommand extends Command {
    [Inject]
    public var imageLoaderService:ImageLoaderService;
    override public function execute():void {
        imageLoaderService.loadInitialImages();
    }
}
}
