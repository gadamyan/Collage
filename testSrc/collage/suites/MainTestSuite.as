/**
 * Created by Gev on 12/18/2014.
 */
package collage.suites {
import collage.cases.CollageLayoutViewMediatorTestCase;
import collage.cases.ImagesModelTestCase;

[Suite]
[RunWith("org.flexunit.runners.Suite")]
public class MainTestSuite {
    public var collageImageViewTestCase:ImagesModelTestCase;
    public var collageLayoutViewMediatorTestCase:CollageLayoutViewMediatorTestCase;
}
}
