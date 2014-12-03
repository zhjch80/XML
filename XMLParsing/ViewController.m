//
//  ViewController.m
//  XMLParsing
//
//  Created by 润华联动 on 14-11-19.
//  Copyright (c) 2014年 润华联动. All rights reserved.
//

#import "ViewController.h"
#import "RMXMLDocument.h"
#import "ItemObject.h"
//#import "PPMoviePlayer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *str = @"http://spider.api.pptv.com/open/yijianlianAPP/yijianlianAPP.xml";
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:str]];
    
    // create a new SMXMLDocument with the contents of sample.xml
    NSError *error;
    RMXMLDocument *document = [RMXMLDocument documentWithData:data error:&error];
    // check for errors
    if (error) {
        NSLog(@"Error while parsing the document: %@", error);
        return;
    }
    
//    NSLog(@"Document:\n %@", document);
    
    RMXMLElement *webName = [document childNamed:@"webName"];
    NSLog(@"webName:%@",webName.value);

    RMXMLElement *webSiteUrl = [document childNamed:@"webSiteUrl"];
    NSLog(@"webSiteUrl:%@",webSiteUrl.value);

    RMXMLElement *videos = [document childNamed:@"video"];
//    NSLog(@"videos:%@",videos);
    
    NSLog(@"title:%@",[videos childNamed:@"title"].value);
    NSLog(@"description:%@",[videos childNamed:@"description"].value);
    NSLog(@"image:%@",[videos childNamed:@"image"].value);
    NSLog(@"web_address:%@",[videos childNamed:@"web_address"].value);
    NSLog(@"pptv_play_link:%@",[videos childNamed:@"pptv_play_link"].value);
    NSLog(@"types:%@",[videos childNamed:@"types"].value);
    NSLog(@"language:%@",[videos childNamed:@"language"].value);
    NSLog(@"creatime:%@",[videos childNamed:@"creatime"].value);
    NSLog(@"resolution:%@",[videos childNamed:@"resolution"].value);
    NSLog(@"op:%@",[videos childNamed:@"op"].value);
    
    
    RMXMLElement *episodes = [videos childNamed:@"episodes"];
    for (RMXMLDocument *episode in [episodes children]){
        NSLog(@"episode.episode:%@",episode.attributes); //key:id,seq
        NSLog(@"episode.op:%@",[episode childNamed:@"op"].value);
        NSLog(@"episode.title:%@",[episode childNamed:@"title"].value);
        NSLog(@"episode.creatime:%@",[episode childNamed:@"creatime"].value);
        NSLog(@"episode.image_120X90:%@",[episode childNamed:@"image_120X90"].value);
        NSLog(@"episode.image_160X90:%@",[episode childNamed:@"image_160X90"].value);
        NSLog(@"episode.image_200X122:%@",[episode childNamed:@"image_200X122"].value);
        NSLog(@"episode.web_address:%@",[episode childNamed:@"web_address"].value);
        NSLog(@"episode.pptv_play_link:%@",[episode childNamed:@"pptv_play_link"].value);
        NSLog(@"episode.resolution:%@",[episode childNamed:@"resolution"].value);
        NSLog(@"episode.duration:%@",[episode childNamed:@"duration"].value);
    }
    
    UIButton *liveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    liveBtn.frame = CGRectMake(100, 200, 100, 30);
    liveBtn.backgroundColor = [UIColor redColor];
    [liveBtn addTarget:self action:@selector(liveBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [liveBtn setTitle:@"直播/点播" forState:UIControlStateNormal];
    [self.view addSubview:liveBtn];
    
}

- (void)liveBtnClicked {
#if 0
    
//    //直播
//    [PPMoviePlayer presentPPMoviePlayerWithPPPlayString:@"" withMovieTitle:@"吴秀波" withIsLive:YES withUIViewController:self];
    
#else
    
//    //点播
//    [PPMoviePlayer presentPPMoviePlayerWithPPPlayString:@"http://v.pptv.com/show/HfZT0DiaeDkxn4ko.html" withMovieTitle:@"半路父子" withIsLive:NO withUIViewController:self];

#endif
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
