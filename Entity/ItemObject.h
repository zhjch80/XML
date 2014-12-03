//
//  ItemObject.h
//  XMLParsing
//
//  Created by runmobile on 14-11-19.
//  Copyright (c) 2014年 润华联动. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemObject : NSObject

@property (nonatomic, strong) NSString *webName;
@property (nonatomic, strong) NSString *webSiteUrl;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *urlset_description;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *web_address;
@property (nonatomic, strong) NSString *pptv_play_link;
@property (nonatomic, strong) NSString *types;
@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) NSString *creatime;
@property (nonatomic, strong) NSString *resolution;
@property (nonatomic, strong) NSString *op;

//episode
@property (nonatomic, strong) NSString *episode_id;
@property (nonatomic, strong) NSString *episode_seq;

@property (nonatomic, strong) NSString *episode_op;
@property (nonatomic, strong) NSString *episode_title;
@property (nonatomic, strong) NSString *episode_creatime;
@property (nonatomic, strong) NSString *episode_image_120X90;
@property (nonatomic, strong) NSString *episode_image_160X90;
@property (nonatomic, strong) NSString *episode_image_200X122;
@property (nonatomic, strong) NSString *episode_pptv_play_link;
@property (nonatomic, strong) NSString *episode_resolution;
@property (nonatomic, strong) NSString *episode_duration;

@end
