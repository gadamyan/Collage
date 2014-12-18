/**
 * Created by Gev on 12/17/2014.
 */
package collage.controller {
import collage.event.ImageEvent;
import collage.service.ImageLoaderService;

import org.robotlegs.mvcs.Command;

public class LoadImageCommand extends Command {
    [Inject]
    public var imageEvent:ImageEvent;
    [Inject]
    public var imageLoaderService:ImageLoaderService;

    override public function execute():void {
        imageLoaderService.loadImage(imageEvent.image);
    }
}
}
