//
//  ViewController.m
//  PairadeChallenge
//
//  Created by Brad Woodard on 7/26/16.
//  Copyright © 2016 elementC. All rights reserved.
//

#import "ViewController.h"
#import "Mode1ViewController.h"
#import "Mode2ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *imageUrls;
@end

@implementation ViewController

- (IBAction)goToMode:(UIButton *)sender {
    if ([sender tag] == 1) {
        NSLog(@"Mode 1");
        [self performSegueWithIdentifier:@"toMode1" sender:self];
    } else {
        NSLog(@"Mode 2");
        [self performSegueWithIdentifier:@"toMode2" sender:self];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Retrieve Data for display in collection views
    _imageUrls = [[NSArray alloc] initWithObjects:
                  @"https://newevolutiondesigns.com/images/freebies/space-wallpaper-29.jpg",
                  @"http://marshall.org/wp-content/themes/marshall/img/featured-space-policy.jpg",
                  @"http://i.huffpost.com/gen/2409604/images/o-BEST-SPACE-PHOTOS-2014-facebook.jpg",
                  @"https://wallpapersinbox.files.wordpress.com/2012/08/hd-space-9.jpg",
                  @"http://www.ufunk.net/wp-content/uploads/2015/11/NASA-The-Sun-In-Ultra-HD-2.jpg",
                  @"http://widewallpaper.info/wp-content/uploads/2015/11/hd-space-desktop.jpg",
                  @"http://www.wallpaperhi.com/thumbnails/detail/20130204/outer%20space%20galaxies%20nasa%201600x1200%20wallpaper_www.wallpaperhi.com_65.jpg",
                  @"http://assets.nydailynews.com/polopoly_fs/1.1712740.1394123884!/img/httpImage/image.jpg_gen/derivatives/gallery_1200/incredible-nasa-photos-space.jpg",
                  @"https://photoshd.files.wordpress.com/2010/02/427020main_pia12832-ca.jpg",
                  @"http://wallpapercave.com/wp/LF5Zy7U.jpg",
                  @"http://www.wallpaperswide.us/wp-content/uploads/2016/04/blue-galaxy-ultra-hd-4k-wallpaper.jpg",
                  @"http://67.media.tumblr.com/f1924ba3d2268e097e48418a396871f1/tumblr_inline_ny2rpydGv11tzhl5u_1280.png",
                  @"http://www.capital.cl/wp-content/uploads/2015/10/scott-kelly-photograph1.jpg",
                  @"https://cdn2.f-cdn.com/contestentries/329981/17879915/569a370ee2c15_thumb900.jpg",
                  @"http://www.spitzer.caltech.edu/uploaded_files/other_files/0006/0651/NASA_HiddenUniverse_10.jpg",
                  @"http://www.onlineindus.com/wp-content/uploads/2016/07/nasa-space-pictures-hd-hd-widescreen-11.jpg",
                  @"http://im.ziffdavisinternational.com/ign_pl/tech/n/nasa/nasa_nm8a.jpg",
                  @"http://www.spitzer.caltech.edu/uploaded_files/other_files/0006/0621/NASA_HiddenUniverse_07.jpg",
                  @"http://photojournal.jpl.nasa.gov/jpeg/PIA13128.jpg",
                  @"http://www.espacoaquarius.com.br/Fotos/workshop_julho2015.jpg",
                  @"http://www.spitzer.caltech.edu/uploaded_files/other_files/0006/6433/NASA-HiddenUniverse-15.jpg",
                  @"http://cs.astronomy.com/cfs-file.ashx/__key/telligent-evolution-components-attachments/13-74-00-00-00-47-82-91/IC1848_2D00_soul_2D00_nebula_2D00_sii_2D00_ha_2D00_oiii_2D00_am_2D00_bill_2D00_snyder.jpg",
                  @"http://static.tumblr.com/ddbae54cabf1b4b5385082a64c35c5dc/smib3xc/IVGn26g9x/tumblr_static_universe.jpg",
                  @"http://www.nasa.gov/sites/default/files/images/297755main_GPN-2001-000009_full.jpg",
                  @"https://svs.gsfc.nasa.gov/vis/a010000/a012000/a012034/Combined.00_08_16_17.Still004.jpg",
                  nil];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.description isEqualToString:@"toMode1"]) {
        Mode1ViewController *vc = segue.destinationViewController;
        vc.incomingImageUrls = _imageUrls;
    } else {
        Mode2ViewController *vc = segue.destinationViewController;
        vc.incomingImageUrls = _imageUrls;
    }
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
