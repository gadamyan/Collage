/**
 * Created by Gev on 12/17/2014.
 */
package collage.controller {
import collage.event.ImageEvent;
import collage.service.ImageLoaderService;

import org.robotlegs.mvcs.Command;

public class LoadImageCommand extends Command {
    [Inject]
    public var _imageEvent:ImageEvent;
    [Inject]
    public var _imageLoaderService:ImageLoaderService;

    override public function execute():void {
        _imageLoaderService.loadImage(_imageEvent.image);
    }
}
}
